import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korastudy_fe/provider/user_provider.dart';
import 'package:korastudy_fe/services/auth_service.dart';
import 'package:korastudy_fe/services/comment_service.dart';
import 'package:korastudy_fe/widgets/comment_item.dart';
import 'package:provider/provider.dart';

class PostCommentScreen extends StatefulWidget {
  final String postId;
  PostCommentScreen({required this.postId});

  @override
  State<PostCommentScreen> createState() => _PostCommentScreenState();
}

class _PostCommentScreenState extends State<PostCommentScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthService _authService = AuthService();
  CommentService _commentService = CommentService();
  TextEditingController _commentController = TextEditingController();

  void createComment(String content, String postId, String uid) async {
    try {
      DocumentReference? result =
          await _commentService.addComment(content, postId, uid, context);
      if (result != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Create new post successfully!')),
        );
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
        setState(() {
          // _buildPostList();
        });
        _commentController.text = "";
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Create post failed!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _buildPostList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/user3.jpg'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: "Hãy nhập bình luận"),
                        controller: _commentController,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send), // Icon gửi
                      onPressed: () {
                        createComment(
                          _commentController.text,
                          widget.postId,
                          Provider.of<UserProvider>(context, listen: false)
                              .userId,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostList() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('comments')
            .where('postId', isEqualTo: widget.postId)
            .snapshots(),
        builder: (context, snapshort) {
          if (snapshort.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshort.hasData || snapshort.data!.docs.isEmpty) {
            return Center(
              child: Text("Không tìm thấy bình luận cho bài đăng"),
            );
          }
          return ListView.builder(
              itemCount: snapshort.data!.docs.length,
              itemBuilder: (context, index) {
                var item = snapshort.data!.docs[index];
                String uid = item['userId'];
                String postId = item['postId'];
                String commentId = item.id;

                return FutureBuilder<Map<String, String?>>(
                  future: _authService.getNameAndImage(uid),
                  builder: (context, userSnapshort) {
                    if (userSnapshort.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (userSnapshort.hasError) {
                      return Center(
                          child: Text('Lỗi khi tải thông tin người dùng.'));
                    }

                    if (!userSnapshort.hasData) {
                      return SizedBox
                          .shrink(); // Hoặc có thể hiển thị thông báo lỗi.
                    }
                    String image = userSnapshort.data!['image'] ??
                        "https://drive.google.com/file/d/1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE/view?usp=sharing";
                    print(image);
                    String name = userSnapshort.data!['name'] ?? "No name";
                    print(name);
                    return CommentItem(
                      commentId: commentId,
                      urlImge: image,
                      name: name,
                      date: item['createdAt'],
                      content: item['content'],
                      postId: postId,
                      likeNum: item['like_num'],
                      unlikeNum: item['not_like_num'],
                    );
                  },
                );
              });
        });
  }
}
