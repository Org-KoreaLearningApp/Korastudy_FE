import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korastudy_fe/provider/user_provider.dart';
import 'package:korastudy_fe/services/auth_service.dart';
import 'package:provider/provider.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  TextEditingController _contentController = TextEditingController();
  AuthService _authService = AuthService();
  late Future<Map<String, dynamic>?> _userDataFuture;
  final List<String> _imageTypes = [
    'https://drive.google.com/file/d/1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE/view?usp=drive_link'
  ];
  int selectedIndex = 0;
  String imgUrl =
      'https://drive.google.com/file/d/1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE/view?usp=drive_link';

  @override
  void initState() {
    super.initState();
    _userDataFuture = _authService.getUserData(
      Provider.of<UserProvider>(context, listen: false).userId,
    );
  }

  void updateImage(String url) async {
    String uid = Provider.of<UserProvider>(context, listen: false).userId;
    String content = url;
    String field = "image";

    await _authService.updateInfo(uid, field, content, context).then((_) {
      setState(() {
        _userDataFuture = _authService.getUserData(uid);
      });
    });
  }

  void updateUserInfo(String field_name) async {
    String uid = Provider.of<UserProvider>(context, listen: false).userId;
    String content = _contentController.text;
    String field = "";
    switch (field_name) {
      case "Profile Name":
        field = "name";
        break;
      case "Birthday":
        field = "birthday";
        break;
      case "Address":
        field = "address";
        break;
      case "Profile Num":
        field = "phoneNum";
        break;
      default:
    }
    await _authService.updateInfo(uid, field, content, context).then((_) {
      setState(() {
        _userDataFuture = _authService.getUserData(uid);
      });
    });
  }

  void showImageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Chọn hình ảnh đại diện',
            style: TextStyle(fontSize: 15),
          ),
          content: ListView.builder(
            itemCount: _imageTypes.length,
            itemBuilder: (context, index) {
              return RadioListTile<String>(
                title: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imgUrl),
                  ),
                ),
                value: _imageTypes[index],
                groupValue: imgUrl,
                onChanged: (String? value) {
                  setState(() {
                    imgUrl = value ??
                        'https://drive.google.com/file/d/1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE/view?usp=drive_link';
                  });
                },
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Đóng'),
            ),
            TextButton(
              onPressed: () async {
                updateImage(_imageTypes[selectedIndex]);
                Navigator.of(context).pop();
              },
              child: Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  void showMyDialog(String field, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Cập nhật thông tin ${field}',
            style: TextStyle(fontSize: 15),
          ),
          content: TextField(
            controller: _contentController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng popup
              },
              child: Text('Đóng'),
            ),
            TextButton(
              onPressed: () async {
                // Thực hiện một hành động khác
                updateUserInfo(field);
                _contentController.text = "";
                Navigator.of(context).pop();
              },
              child: Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  Widget _infoRow(IconData icon, String title, String content) {
    return GestureDetector(
      child: Row(
        children: [
          Icon(icon, size: 30, color: const Color.fromARGB(255, 53, 53, 53)),
          SizedBox(
            width: 30,
          ),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  color: Color(0xFF1EA5FC),
                ),
              )
            ],
          )
        ],
      ),
      onTap: () {
        if (title == "Profile Image") {
          showImageDialog();
        } else {
          showMyDialog(title, content);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: _userDataFuture,
            builder: (context, snapshort) {
              if (snapshort.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshort.hasError) {
                return Center(
                  child: Text('Error: ${snapshort.error}'),
                );
              }

              if (!snapshort.hasData || snapshort.data == null) {
                return Center(
                  child: Text('Không tìm thấy dữ liệu người dùng'),
                );
              }
              Map<String, dynamic> data = snapshort.data!;
              return ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Màu viền
                        width: 1.0, // Độ dày viền
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(data['image']),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  data['name'] ?? 'No name',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(data['email'] ?? 'No email')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      _infoRow(Icons.camera, "Profile Image", "Image"),
                      SizedBox(
                        height: 20,
                      ),
                      _infoRow(Icons.person, "Profile Name",
                          data['name'] ?? 'No namw'),
                      SizedBox(
                        height: 20,
                      ),
                      _infoRow(Icons.schedule, "Birthday",
                          data['birthday'] ?? 'No namw'),
                      SizedBox(
                        height: 20,
                      ),
                      _infoRow(Icons.home, "Address", data['address']),
                      SizedBox(
                        height: 20,
                      ),
                      _infoRow(Icons.phone, "Phone Num",
                          data['phoneNum'] ?? 'No phone')
                    ],
                  )
                ],
              );
            }));
  }
}
