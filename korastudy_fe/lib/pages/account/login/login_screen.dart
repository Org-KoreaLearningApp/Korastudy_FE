import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/account/reset_password_screen.dart';
import 'package:korastudy_fe/pages/account/signup/register_screen.dart';
import 'package:korastudy_fe/pages/home/home_screen.dart';
import 'package:korastudy_fe/provider/user_provider.dart';
import 'package:korastudy_fe/services/auth_service.dart';
import 'package:korastudy_fe/services/secure_storage_service.dart';
import 'package:korastudy_fe/widgets/login_input.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  // final SharedPreferencesService _prefsService = SharedPreferencesService();
  final SecureStorageService _secureStorageService = SecureStorageService();
  final UserProvider _userProvider = UserProvider();

  bool _saveAccount = false;
  String _errorText = "";

  @override
  void initState() {
    super.initState();
    loadAcc();
  }

  Future<void> loadAcc() async {
    final credentials = await _secureStorageService.getCredentials();
    if (credentials['email'] != null) {
      _emailController.text = credentials['email']!;
      setState(() {
        _saveAccount = true;
      });
    }
    if (credentials['password'] != null)
      _passController.text = credentials['password']!;
  }

  bool validateInput() {
    bool checkout = true;
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    setState(() {
      if (_emailController.text.isEmpty || _passController.text.isEmpty) {
        _errorText = 'Vui lòng nhập đủ dữ liệu';
        checkout = false;
      } else if (!regExp.hasMatch(_emailController.text.trim())) {
        _errorText = 'Vui lòng nhập đúng định dạng email ten@gmail.com';
        checkout = false;
      } else if (_passController.text.length < 6) {
        _errorText = 'Mật khẩu phải có ít nhất 6 ký tự';
        checkout = false;
      }
    });
    return checkout;
  }

  void login() async {
    bool checkout = validateInput();
    if (checkout) {
      var user = await _authService.login(
        _emailController.text.trim(),
        _passController.text.trim(),
      );
      if (user != null) {
        if (_saveAccount == true) {
          _secureStorageService.saveCredentials(
            _emailController.text.trim(),
            _passController.text.trim(),
          );
        } else {
          _secureStorageService.clearCredentials();
        }

        await Provider.of<UserProvider>(context, listen: false).fetchUserId();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('login failed!')),
        // );
        setState(() {
          _errorText = "Email hoặc mật khẩu chưa đúng";
        });
      }
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
          'Đăng nhập',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1EA5FC),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                Image(image: AssetImage('assets/images/logo.png')),
                SizedBox(
                  height: 16.0,
                ),
                if (_errorText.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      _errorText,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                SizedBox(
                  height: 15.0,
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
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      suffixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    controller: _passController,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _saveAccount,
                      onChanged: (bool? value) {
                        setState(() {
                          _saveAccount = value ?? false;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    Text(
                      "Lưu tài khoản",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen()),
                        );
                      },
                      child: Text(
                        "Quên mật khẩu",
                        style: TextStyle(
                          color: Color(0xFF1EA5FC),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF1EA5FC),
                          decorationThickness: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
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
                        onPressed: login,
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
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                      ),
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
