import 'package:flutter/material.dart';
import 'package:korastudy_fe/widgets/post_list.dart';
import 'package:korastudy_fe/widgets/search_input.dart';

class PostSearchScreen extends StatefulWidget {
  const PostSearchScreen({super.key});

  @override
  State<PostSearchScreen> createState() => _PostSearchScreenState();
}

class _PostSearchScreenState extends State<PostSearchScreen> {
  Widget postListWidget = SizedBox.shrink();

  void updatePostList(Widget newWidget) {
    setState(() {
      postListWidget = newWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SearchInput(
            onSearchResult: updatePostList,
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(child: postListWidget),
        ],
      ),
    );
  }
}
