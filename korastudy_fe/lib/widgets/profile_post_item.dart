import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/forums/post_screen.dart';
import 'package:korastudy_fe/services/post_service.dart';

class ProfilePostItem extends StatelessWidget {
  final String urlImge;
  final String name;
  final String create_at;
  final String title;
  final String text;
  final int likeNum;
  final int commentNum;
  final int viewNum;
  final String postId;
  PostService _postService = PostService();

  bool isLike = false;

  ProfilePostItem({
    required this.urlImge,
    required this.name,
    required this.create_at,
    required this.title,
    required this.text,
    required this.likeNum,
    required this.commentNum,
    required this.viewNum,
    required this.postId,
  });

  void transferToDetail(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostScreen(postName: title, postId: postId)));
  }

  Future<void> showDelConformDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận xóa bài đăng'),
          content: Text('Bạn có chắc chắn muốn xóa bài post này không?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                await _postService.deletePost(postId);
                Navigator.of(context).pop();
              },
              child: Text('Xóa', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        transferToDetail(
          context,
        );
      },
      child: Container(
        height: 210.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFEEEEEE),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(urlImge),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          create_at,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Color(0xFFA5A5A5)),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        showDelConformDialog(context);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              // Expanded(child:
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              // ),
              // Expanded(child:
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(color: Colors.black),
              ),
              // ),
              Expanded(
                child: Center(
                  child: Row(
                    children: [
                      // Flexible(
                      // child:
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: Color(0xFFA5A5A5),
                            size: 20,
                          ),
                          Text("${likeNum} thích",
                              style: TextStyle(
                                  color: Color(0xFFA5A5A5), fontSize: 12))
                        ],
                      ),
                      // ),
                      // Flexible(child:
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.comment),
                            color: Color(0xFFA5A5A5),
                            iconSize: 20,
                          ),
                          Text("${commentNum} bình luận",
                              style: TextStyle(
                                  color: Color(0xFFA5A5A5), fontSize: 12))
                        ],
                      ),
                      // ),
                      // Flexible(child:
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.view_agenda),
                            color: Color(0xFFA5A5A5),
                            iconSize: 20,
                          ),
                          Text("${viewNum} lượt xem",
                              style: TextStyle(
                                  color: Color(0xFFA5A5A5), fontSize: 12))
                        ],
                      ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}