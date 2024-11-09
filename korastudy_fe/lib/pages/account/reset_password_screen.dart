import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/account/signup/register_screen.dart';
import 'package:korastudy_fe/services/auth_service.dart';
import 'package:korastudy_fe/widgets/login_input.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _message = '';

  Future<void> resetPass() async {
    String result =
        await _authService.sendPasswordResetEmail(_emailController.text);
    setState(() {
      _message = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Quên mật khẩu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1EA5FC),
      ),
      body: Container(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                Image(image: AssetImage('assets/images/logo.png')),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Đặt lại mật khẩu',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 20.0,
                ),
                if (_message.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      _message,
                      style: TextStyle(
                        color: _message.contains('Error')
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: LoginInput(
                    label: "Nhập địa chỉ email",
                    icon: Icons.email,
                    controller: _emailController,
                  ),
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
                        onPressed: resetPass,
                        child: Text(
                          "Gửi email tái lập mật khẩu",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
