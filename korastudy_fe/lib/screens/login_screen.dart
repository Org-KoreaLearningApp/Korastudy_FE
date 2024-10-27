import 'package:flutter/material.dart';
import 'package:korastudy_fe/screens/register_screen.dart';
import 'package:korastudy_fe/widgets/login_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(
          'Đăng nhập',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1EA5FC),
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              // Image.asset('assets/images/bg.png'),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: LoginInput(label: "Email", icon: Icons.email),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: LoginInput(label: "Mật khẩu", icon: Icons.lock),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Quên mật khẩu?",
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
                        "Đăng nhập",
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
                          backgroundColor: Color(0xFFEEEEEE), elevation: 5),
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
                    Text("Bạn chưa có tài khoản?"),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RegisterScreen()), // Replace with your next page
                          );
                        },
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                            color: Color(0xFF1EA5FC),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
