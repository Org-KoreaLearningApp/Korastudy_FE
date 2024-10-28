import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        "Chào mọi người,\nMình mới thi TOPIK II và đã đạt được cấp 4 sau 6 tháng ôn luyện từ trình độ TOPIK I. Mình muốn chia sẻ một chút kinh nghiệm cá nhân để các bạn có thể tham khảo và chuẩn bị tốt hơn cho kỳ thi sắp tới.\n1. Lộ trình học tập\nTháng 1-2: Tập trung vào ngữ pháp và từ vựng từ cấp 2 đến cấp 4. Mình đã sử dụng giáo trình \"Yonsei Korean\" và ứng dụng \"TOPIK Guide\" để học từ mới mỗi ngày.\nTháng 3-4: Luyện kỹ năng nghe bằng cách xem các chương trình Hàn Quốc không có phụ đề (ví dụ như Running Man và Infinity Challenge). Mình cũng luyện tập viết luận ngắn, mỗi tuần khoảng 2 bài viết.\nTháng 5-6: Làm đề thi thử TOPIK II thường xuyên. Mỗi ngày, mình cố gắng hoàn thành ít nhất 1 đề thi để quen với cấu trúc đề và cải thiện thời gian làm bài.\n2. Tài liệu ôn thi\nSách: Mình khuyên dùng bộ sách \"TOPIK II Master\" để luyện đề và hiểu rõ từng dạng câu hỏi trong kỳ thi.\nApp luyện nghe: Mình sử dụng \"TOPIK ONE\" và \"Memrise\" để luyện từ vựng và ngữ pháp qua các bài tập hàng ngày.\nWebsite: Các bạn có thể vào trang TOPIK Guide để tải đề thi TOPIK chính thức và tham khảo các bài mẫu.\n3. Chiến thuật làm bài\nNghe: Khi luyện nghe, hãy chú ý từ khóa quan trọng và tập trung vào những câu hỏi dễ trước. Phần khó hơn thì mình dành thời gian cuối cùng để trả lời.\nĐọc: Đọc kỹ yêu cầu của câu hỏi trước khi đọc đoạn văn để không bị mất thời gian. Mình thường dành 5 phút cuối để rà soát lại đáp án.\nViết: Phần viết là phần cần luyện tập thường xuyên nhất. Các bạn có thể viết về các chủ đề quen thuộc như gia đình, công việc, cuộc sống hằng ngày, và nhờ bạn bè hoặc giáo viên chỉnh sửa giúp.\n4. Kinh nghiệm khi thi\nĐến sớm 30 phút để chuẩn bị tinh thần thoải mái.\nMang theo đủ giấy tờ cá nhân và kiểm tra lại dụng cụ thi trước khi vào phòng.\nTrong phần thi viết, mình khuyên các bạn hãy viết nháp một dàn ý trước để tránh lạc đề và tiết kiệm thời gian chỉnh sửa.\nKết luận\nHy vọng những chia sẻ trên sẽ hữu ích cho các bạn đang chuẩn bị thi TOPIK. Đừng quá căng thẳng, hãy ôn tập một cách có kế hoạch và kiên trì mỗi ngày! Nếu các bạn có thắc mắc gì, đừng ngại để lại bình luận, mình sẽ cố gắng giúp đỡ.\nChúc mọi người thi tốt! 😊",
                        style: TextStyle(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}