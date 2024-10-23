import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String urlImge;
  final String name;
  final int hour;
  final String title;
  final String summary;
  final int likeNum;
  final int commentNum;
  final int viewNum;

  PostItem({
    required this.urlImge,
    required this.name,
    required this.hour,
    required this.title,
    required this.summary,
    required this.likeNum,
    required this.commentNum,
    required this.viewNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
            // Expanded(child:
            Text(
              "Kinh nghiệm ôn thi TOPIK II từ TOPIK I trong 6 tháng",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            // ),
            // Expanded(child:
            Text(
              "Chào mọi người, mình mới thi TOPIK II và đã đạt được cấp 4 sau 6 tháng ôn luyện từ trình độ TOPIK I. Mình muốn chia sẻ một chút...",
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
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.thumb_up),
                          color: Color(0xFFA5A5A5),
                          iconSize: 20,
                        ),
                        Text("113 thích",
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
                        Text("113 bình luận",
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
                        Text("113 lượt xem",
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
    );
  }
}
