import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korastudy_fe/provider/user_provider.dart';
import 'package:korastudy_fe/services/auth_service.dart';
import 'package:korastudy_fe/widgets/profile_post_item.dart';
import 'package:provider/provider.dart';

class ProfilePostListScreen extends StatefulWidget {
  const ProfilePostListScreen({super.key});

  @override
  State<ProfilePostListScreen> createState() => _ProfilePostListScreenState();
}

class _ProfilePostListScreenState extends State<ProfilePostListScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: _buildPostList(),
    );
  }

  Widget _buildPostList() {
    return StreamBuilder(
        stream: _firestore
            .collection('posts')
            .where(
              'uid',
              isEqualTo:
                  Provider.of<UserProvider>(context, listen: false).userId,
            )
            .snapshots(),
        builder: (context, snapshort) {
          if (snapshort.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshort.hasData || snapshort.data!.docs.isEmpty) {
            return Center(
              child: Text("Bạn chưa có bài đăng nào"),
            );
          }
          return ListView.builder(
              itemCount: snapshort.data!.docs.length,
              itemBuilder: (context, index) {
                var item = snapshort.data!.docs[index];
                String uid = item['uid'];
                String postId = item.id;

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
                        "https://drive.google.com/uc?id=1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE";
                    print(image);
                    String name = userSnapshort.data!['name'] ?? "No name";
                    print(name);
                    return ProfilePostItem(
                        urlImge: image,
                        name: name,
                        create_at: item['create_at'].toString(),
                        title: item['title'],
                        text: item['content'],
                        likeNum: item['like_num'] ?? 0,
                        commentNum: item['comment_num'] ?? 0,
                        viewNum: item['view_num'] ?? 0,
                        postId: postId);
                  },
                );
              });
        });
  }
}
