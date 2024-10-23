import 'package:flutter/material.dart';
import 'package:korean_flutter/widgets/post_list.dart';
import 'package:korean_flutter/widgets/search_input.dart';

class PostSearchScreen extends StatefulWidget {
  const PostSearchScreen({super.key});

  @override
  State<PostSearchScreen> createState() => _PostSearchScreenState();
}

class _PostSearchScreenState extends State<PostSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SearchInput(),
          SizedBox(
            height: 20.0,
          ),
          Expanded(child: PostList()),
        ],
      ),
    );
  }
}
