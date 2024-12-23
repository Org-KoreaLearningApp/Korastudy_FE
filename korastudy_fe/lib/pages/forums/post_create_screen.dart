import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/home/home_screen.dart';
import 'package:korastudy_fe/pages/profile/profile_screen.dart';
import 'package:korastudy_fe/provider/user_provider.dart';
import 'package:korastudy_fe/services/post_service.dart';
import 'package:provider/provider.dart';

class PostCreateScreen extends StatefulWidget {
  const PostCreateScreen({super.key});

  @override
  State<PostCreateScreen> createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  final List<String> _postTypes = [
    // 'Mới đăng',
    // 'Phổ biến',
    'Tham gia kỳ thi',
    'Nghe',
    'Đọc',
    'Viết'
  ];
  int selectedIndex = 0;

  bool validateFields() {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  PostService _postService = PostService();
  void createPost(String title, String content, int type, String uid) async {
    if (!validateFields()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Create post failed!')),
      );
    } else {
      try {
        DocumentReference? result =
            await _postService.addPost(title, content, type, uid, context);
        if (result != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Create new post successfully!')),
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Create post failed!')),
        );
      }
    }
  }

  void re_setup() {
    setState(() {
      _titleController.text = "";
      _contentController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration.collapsed(
                hintText: "Tên tiêu đề",
                border: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                )),
            controller: _titleController,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _postTypes.length,
              itemBuilder: (context, index) {
                return RadioListTile<int>(
                  title: Text(_postTypes[index]),
                  value: index, // Giá trị là chỉ số của loại bài đăng
                  groupValue: selectedIndex,
                  onChanged: (int? value) {
                    setState(() {
                      selectedIndex = value ?? 0; // Cập nhật chỉ số được chọn
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Nhập nội dung",
                border: OutlineInputBorder(),
              ),
              controller: _contentController,
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: re_setup,
                  child: Text(
                    "Tái lập",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    createPost(
                      _titleController.text,
                      _contentController.text,
                      selectedIndex,
                      Provider.of<UserProvider>(context, listen: false).userId,
                    );
                  },
                  child: Text(
                    "Đăng bài",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xFF1EA5FC)),
                ),
              ),
              // Expanded(
              //     child: TextButton(
              //         onPressed: () {},
              //         child: Text(
              //           "Lưu nháp",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         )))
            ],
          ),
        ],
      ),
    );
  }
}
