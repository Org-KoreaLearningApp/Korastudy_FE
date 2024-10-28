import 'package:flutter/material.dart';
import 'package:korastudy_fe/widgets/comment_item.dart';

class PostCommentScreen extends StatefulWidget {
  const PostCommentScreen({super.key});

  @override
  State<PostCommentScreen> createState() => _PostCommentScreenState();
}

class _PostCommentScreenState extends State<PostCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CommentItem(
                  urlImge: 'assets/images/user3.jpg',
                  name: "name",
                  hour: 2,
                  title: "title",
                  summary: "summary",
                  likeNum: 2,
                  unlikeNum: 2,
                ),
              ],
            ),
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
