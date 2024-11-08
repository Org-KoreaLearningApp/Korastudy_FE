import 'package:flutter/material.dart';

class GrammarCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final VoidCallback onLike;
  final VoidCallback onCheck;

  const GrammarCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onLike,
    required this.onCheck,
  }) : super(key: key);

  @override
  _GrammarCardState createState() => _GrammarCardState();
}

class _GrammarCardState extends State<GrammarCard> {
  bool _isChecked = false;
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = true; // Chỉ đặt _isChecked thành true khi nhấn thẻ
          widget.onCheck(); // Gọi hàm khi nhấn vào thẻ
        });
      },
      child: Container(
        width: 380,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, 2),
              blurRadius: 1,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, -2),
              blurRadius: 4,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(-2, 0),
              blurRadius: 1,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(2, 0),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Phần bên trái chứa tiêu đề và subtitle
              Row(
                children: <Widget>[
                  // Nút check chỉ xuất hiện khi _isChecked là true
                  if (_isChecked)
                    IconButton(
                      icon: Icon(
                        Icons.check_outlined,
                        color: Colors.blue, // Màu nút check
                      ),
                      onPressed: () {
                        // Không làm gì khi nút check được nhấn
                      },
                    ),
                  // Cột chứa tiêu đề và subtitle
                  SizedBox(
                    width: 200, // Chiều rộng cho cột tiêu đề
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Căn giữa cột
                      crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
                      children: <Widget>[
                        Text(
                          widget.title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                          overflow:
                              TextOverflow.ellipsis, // Thêm thuộc tính này
                          maxLines: 1, // Giới hạn số dòng
                        ),
                        SizedBox(
                            height:
                                5), // Giảm khoảng cách giữa title và subtitle
                        Text(
                          widget.subtitle,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: 16,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                          overflow:
                              TextOverflow.ellipsis, // Thêm thuộc tính này
                          maxLines: 1, // Giới hạn số dòng
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Nút thích
              IconButton(
                icon: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color:
                      _isLiked ? Colors.red : Colors.black, // Đổi màu khi nhấn
                ),
                onPressed: () {
                  setState(() {
                    _isLiked = !_isLiked; // Chuyển đổi trạng thái thích
                    widget.onLike(); // Gọi hàm khi nhấn nút "Thích"
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}