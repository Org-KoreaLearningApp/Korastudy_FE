import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/account/signup/register_screen.dart';
import 'package:korastudy_fe/services/auth_service.dart';
import 'package:korastudy_fe/widgets/login_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void login() async {
    var user = await _authService.login(
      _emailController.text.trim(),
      _passController.text.trim(),
    );
    if (user != null) {
      print(user.toString());
    }
  }

  void loginByGoogle() async {
    var user = await _authService.loginByGoogle();
    if (user != null)
      print(user.toString());
    else
      print("Error in sign in with google");
  }

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                Image(image: AssetImage('assets/images/logo.png')),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  child: LoginInput(
                    label: "Email",
                    icon: Icons.email,
                    controller: _emailController,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: LoginInput(
                    label: "Mật khẩu",
                    icon: Icons.lock,
                    controller: _passController,
                  ),
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
                        onPressed: loginByGoogle,
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
                      GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
