import 'package:flutter/material.dart';

class DictionaryVerbWidget extends StatelessWidget {
  final List<Map<String, String>> koreanVerbs = [
    {'verb': '하다', 'note': 'Quá khứ: 했다, Kính ngữ: 하십니다'},
    {'verb': '가다', 'note': 'Quá khứ: 갔다, Kính ngữ: 가십니다'},
    // Thêm các động từ khác vào đây
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF46A0E5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          height: 50, // Adjust the height as needed
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Tìm kiếm từ vựng',
              hintStyle: TextStyle(color: const Color.fromARGB(255, 70, 67, 67)),
              prefixIcon: Icon(Icons.search, color: const Color.fromARGB(255, 0, 0, 0)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Positioned(
              top: 146,
              left: 0,
              child: Container(
                width: 390,
                height: 33,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 25,
                      child: Container(
                        width: 140,
                        height: 31,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(254, 182, 156, 1),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 5,
                              left: 10,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.whatshot,
                                    color: Color.fromRGBO(223, 17, 37, 1),
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Từ khóa hot',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(223, 17, 37, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      letterSpacing: -0.3,
                                      fontWeight: FontWeight.normal,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: koreanVerbs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(koreanVerbs[index]['verb']!),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Ghi chú'),
                          content: Text(koreanVerbs[index]['note']!),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Đóng'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}