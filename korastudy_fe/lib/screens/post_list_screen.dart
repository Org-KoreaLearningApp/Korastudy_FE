import 'package:flutter/material.dart';
import 'package:korastudy_fe/widgets/post_list.dart';
import 'package:korastudy_fe/widgets/post_type_button.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: 40.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                PostTypeButton(typeName: "Mới đăng"),
                SizedBox(
                  width: 10.0,
                ),
                PostTypeButton(typeName: "Phổ biến"),
                SizedBox(
                  width: 10.0,
                ),
                PostTypeButton(typeName: "Tham gia kỳ thi"),
                SizedBox(
                  width: 10.0,
                ),
                PostTypeButton(typeName: "Nghe"),
                SizedBox(
                  width: 10.0,
                ),
                PostTypeButton(typeName: "Đọc"),
                SizedBox(
                  width: 10.0,
                ),
                PostTypeButton(typeName: "Viết"),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: PostList(),
          ),
        ],
      ),
    );
  }
}
