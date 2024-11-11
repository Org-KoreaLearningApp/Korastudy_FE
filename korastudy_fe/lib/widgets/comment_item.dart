import 'package:flutter/material.dart';
import 'package:korastudy_fe/services/comment_service.dart';

class CommentItem extends StatefulWidget {
  final String commentId;
  final String urlImge;
  final String name;
  final String date;
  final String content;
  final String postId;
  final int likeNum;
  final int unlikeNum;

  // bool isUnLike = false;

  CommentItem({
    required this.commentId,
    required this.urlImge,
    required this.name,
    required this.date,
    required this.content,
    required this.postId,
    required this.likeNum,
    required this.unlikeNum,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool isLike = false;
  int likeNum = 0;

  CommentService _commentService = CommentService();

  @override
  Widget build(BuildContext context) {
    likeNum = widget.likeNum;
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
                backgroundImage: NetworkImage(widget.urlImge),
              ),
              SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.date,
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
            widget.content,
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
                    onPressed: () async {
                      setState(() {
                        isLike = !isLike;
                        likeNum = isLike ? likeNum + 1 : likeNum - 1;
                      });

                      await _commentService.updateLikeCount(
                          widget.commentId, likeNum);
                    },
                    icon: isLike
                        ? Icon(Icons.thumb_up_rounded)
                        : Icon(Icons.thumb_up),
                    color: isLike ? Color(0xFF1EA5FC) : Color(0xFFA5A5A5),
                    iconSize: 20,
                  ),
                  Text("${likeNum} thích",
                      style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 12))
                ],
              ),
              // Row(
              //   children: [
              //     IconButton(
              //       onPressed: () {},
              //       icon: Icon(Icons.thumb_down),
              //       color: Color(0xFFA5A5A5),
              //       iconSize: 20,
              //     ),
              //     Text("${widget.unlikeNum} không thích",
              //         style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 12))
              //   ],
              // ),
            ],
          ),
          // ),
        ],
      ),
    );
  }
}
