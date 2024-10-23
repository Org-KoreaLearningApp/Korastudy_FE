import 'package:flutter/material.dart';

class CommentItem extends StatefulWidget {
  final String urlImge;
  final String name;
  final int hour;
  final String title;
  final String summary;
  final int likeNum;
  final int unlikeNum;

  CommentItem({
    required this.urlImge,
    required this.name,
    required this.hour,
    required this.title,
    required this.summary,
    required this.likeNum,
    required this.unlikeNum,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('assets/images/user3.jpg'),
              ),
              SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "매진 무궁와",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "2 hour",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Color(0xFFA5A5A5)),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Bài viết của bạn rất chi tiết và hữu ích! Mình mới bắt đầu học ngữ pháp TOPIK II, và phần này khá khó đối với mình.",
            style: TextStyle(color: Colors.black),
          ),
          // ),
          // Expanded(child:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_up),
                    color: Color(0xFFA5A5A5),
                    iconSize: 20,
                  ),
                  Text("113 thích",
                      style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 12))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_down),
                    color: Color(0xFFA5A5A5),
                    iconSize: 20,
                  ),
                  Text("113 không thích",
                      style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 12))
                ],
              ),
            ],
          ),
          // ),
        ],
      ),
    );
  }
}
