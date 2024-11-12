import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korastudy_fe/services/auth_service.dart';
import 'package:korastudy_fe/widgets/post_item.dart';

class SearchInput extends StatefulWidget {
  final Function(Widget) onSearchResult;

  SearchInput({required this.onSearchResult});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];
  AuthService _authService = AuthService();

  void search() async {
    if (_searchController.text.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where('title', isGreaterThanOrEqualTo: _searchController.text)
        .where('title', isLessThanOrEqualTo: _searchController.text + '\uf8ff')
        .get();
    setState(() {
      _searchResults = snapshot.docs;
    });

    if (_searchResults.isEmpty) {
      Widget result = Center(
        child: Text("Không tìm thấy bài đăng '${_searchController.text}'"),
      );
      widget.onSearchResult(result);
    } else {
      Widget postListResult = ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            var item = _searchResults[index].data() as Map<String, dynamic>;
            String uid = item['uid'];
            String postId = _searchResults[index].id;

            return FutureBuilder<Map<String, String?>>(
              future: _authService.getNameAndImage(uid),
              builder: (context, userSnapshort) {
                if (userSnapshort.connectionState == ConnectionState.waiting) {
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
                  postId: postId,
                );
              },
            );

            // return PostItem(
            //     urlImge: item['image'] ??
            //         'https://drive.google.com/file/d/1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE/view?usp=drive_link',
            //     name: item['name'],
            //     create_at: item['create_at'],
            //     title: item['title'],
            //     text: item['text'],
            //     likeNum: item['like_num'] ?? 0,
            //     commentNum: item['comment_num'] ?? 0,
            //     viewNum: item['view_num'] ?? 0);
          });
      widget.onSearchResult(postListResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        hintText: "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xFFA5A5A5)),
        ),
        suffixIcon: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1EA5FC),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: search,
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ),
      ),
      controller: _searchController,
    );
  }
}
