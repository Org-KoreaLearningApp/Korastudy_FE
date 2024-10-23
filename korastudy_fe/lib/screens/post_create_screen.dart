import 'package:flutter/material.dart';

class PostCreateScreen extends StatefulWidget {
  const PostCreateScreen({super.key});

  @override
  State<PostCreateScreen> createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
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
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Tái lập",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Đăng bài",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xFF1EA5FC)),
                ),
              ),
              Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Lưu nháp",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
