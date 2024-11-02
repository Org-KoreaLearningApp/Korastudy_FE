import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/account/login/login_screen.dart';
import 'package:korastudy_fe/pages/home/home_screen.dart';
import 'package:korastudy_fe/widgets/login_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1EA5FC),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg.png')),
        ),
        child: Expanded(
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/logo.png'),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        child:
                            LoginInput(label: "Nhập tên", icon: Icons.person),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child:
                            LoginInput(label: "Nhập email", icon: Icons.email),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: LoginInput(
                            label: "Nhập mật khẩu", icon: Icons.lock),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: LoginInput(
                            label: "Xác nhận mật khẩu", icon: Icons.lock),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (bool? value) {},
                            activeColor: Colors.black,
                          ),
                          Text(
                            "Lưu tài khoản",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF1EA5FC),
                                elevation: 5,
                                shadowColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: Text(
                                "Đăng ký",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              label: Text(
                                "Đăng nhập bằng Google",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              icon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFEEEEEE),
                                  elevation: 5),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Bạn đã có tài khoản?"),
                            SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Đăng nhập",
                                style: TextStyle(
                                  color: Color(0xFF1EA5FC),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
