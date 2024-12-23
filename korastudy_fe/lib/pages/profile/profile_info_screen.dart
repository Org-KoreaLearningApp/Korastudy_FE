import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korastudy_fe/pages/home/home_screen.dart';
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
    'https://drive.google.com/uc?id=1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE',
    'https://drive.google.com/uc?id=17QJtmM5dbJ9U4KhgxyX3mNrg3wewG7mQ'
  ];
  int selectedIndex = 0;
  String imgUrl =
      'https://drive.google.com/uc?id=1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE';

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

  // Widget _loginReminder() {
  //   return Container(
  //     child: Center(
  //       child: Column(
  //         children: [
  //           Text(
  //               "Vui lòng đăng nhập hoặc đăng ký để xem thông tin cá nhân của bạn."),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Expanded(
  //             child: ElevatedButton.icon(
  //               onPressed: () {},
  //               label: Text(
  //                 "Đăng nhập",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                 ),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                   backgroundColor: Color(0xFF1EA5FC), elevation: 5),
  //             ),
  //           ),
  //           Expanded(
  //             child: ElevatedButton.icon(
  //               onPressed: () {},
  //               label: Text(
  //                 "Đăng ký",
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                 ),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                   backgroundColor: Color(0xFFEEEEEE), elevation: 5),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: _imageTypes.length,
              itemBuilder: (context, index) {
                return RadioListTile<String>(
                  title: CircleAvatar(
                    backgroundImage: NetworkImage(_imageTypes[index]),
                  ),
                  value: _imageTypes[index],
                  groupValue: imgUrl,
                  onChanged: (String? value) {
                    setState(() {
                      if (value != null) {
                        imgUrl = value;
                        selectedIndex = index;
                        updateImage(value); // Update the image in your service
                        Navigator.of(context)
                            .pop(); // Close the dialog after selection
                      }
                    });
                  },
                );
              },
            ),
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

  void showSignoutConformDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Bạn có chắc chắn muốn đăng xuất khỏi hệ thống?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                await _authService.signOut();
                context.read<UserProvider>().clearUserId();
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Đăng xuất', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Widget _infoRow(IconData icon, String title, String content) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 239, 239),
          // border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(5.0), // Bo góc viền
        ),
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
        padding: EdgeInsets.all(20.0),
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
                        height: 10,
                      ),
                      _infoRow(Icons.person, "Profile Name",
                          data['name'] ?? 'No namw'),
                      SizedBox(
                        height: 10,
                      ),
                      _infoRow(Icons.schedule, "Birthday",
                          data['birthday'] ?? 'No namw'),
                      SizedBox(
                        height: 10,
                      ),
                      _infoRow(Icons.home, "Address", data['address']),
                      SizedBox(
                        height: 10,
                      ),
                      _infoRow(Icons.phone, "Phone Num",
                          data['phoneNum'] ?? 'No phone'),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.logout, size: 30, color: Colors.red),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Đăng xuất",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          showSignoutConformDialog(context);
                        },
                      ),
                    ],
                  )
                ],
              );
            }));
  }
}
