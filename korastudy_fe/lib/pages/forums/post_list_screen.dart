import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korastudy_fe/services/auth_service.dart';
import 'package:korastudy_fe/widgets/post_item.dart';
import 'package:korastudy_fe/widgets/post_list.dart';
import 'package:korastudy_fe/widgets/post_type_button.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  AuthService _authService = AuthService();

  int _selectedIndex = 0;
  final List<String> _filters = [
    'Tất cả',
    // 'Phổ biến',
    'Tham gia kỳ thi',
    'Nghe',
    'Đọc',
    'Viết'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: 40.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(_filters[index]),
                      selected: _selectedIndex == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedIndex = selected ? index : _selectedIndex;
                        });
                      },
                      selectedColor: Color(0xFF1EA5FC),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: _selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                    ),
                  );
                }),
            // ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: [
            //     PostTypeButton(typeName: "Mới đăng"),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     PostTypeButton(typeName: "Phổ biến"),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     PostTypeButton(typeName: "Tham gia kỳ thi"),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     PostTypeButton(typeName: "Nghe"),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     PostTypeButton(typeName: "Đọc"),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     PostTypeButton(typeName: "Viết"),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //   ],
            // ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: _buildPostList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPostList() {
    String selectedFilter = _filters[_selectedIndex];

    return StreamBuilder(
        stream: selectedFilter == 'Tất cả'
            ? FirebaseFirestore.instance.collection('posts').snapshots()
            : FirebaseFirestore.instance
                .collection('posts')
                .where('type', isEqualTo: _selectedIndex - 1)
                .snapshots(),
        builder: (context, snapshort) {
          if (snapshort.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshort.hasData || snapshort.data!.docs.isEmpty) {
            return Center(
              child: Text("Không tìm thấy bài đăng '${selectedFilter}'"),
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
                        "https://drive.google.com/file/d/1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE/view?usp=sharing";
                    print(image);
                    String name = userSnapshort.data!['name'] ?? "No name";
                    print(name);
                    return PostItem(
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
