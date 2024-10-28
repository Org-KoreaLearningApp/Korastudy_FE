import 'package:flutter/material.dart';
import 'package:korastudy_fe/widgets/post_item.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Expanded(
            child: PostItem(
                urlImge: 'assets/images/user3.jpg',
                name: "name",
                hour: 2,
                title: "title",
                summary: "summary",
                likeNum: 2,
                commentNum: 2,
                viewNum: 2),
          ),
        ],
      ),
    );
  }
}
