import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/account/login/login_screen.dart';
import 'package:korastudy_fe/pages/home/home_screen.dart';
import 'package:korastudy_fe/provider/user_provider.dart';
import 'package:korastudy_fe/services/secure_storage_service.dart';
import 'package:korastudy_fe/widgets/login_input.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SecureStorageService _secureStorageService = SecureStorageService();

  bool _saveAccount = false;
  String _errorText = "";

  bool validateInput() {
    bool checkout = true;
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    setState(() {
      if (_nameController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _passwordController.text.isEmpty ||
          _repasswordController.text.isEmpty) {
        _errorText = 'Vui lòng nhập đủ dữ liệu';
        checkout = false;
      } else if (!regExp.hasMatch(_emailController.text.trim())) {
        _errorText = 'Vui lòng nhập đúng định dạng email ten@gmail.com';
        checkout = false;
      } else if (_passwordController.text.length < 6) {
        _errorText = 'Mật khẩu phải có ít nhất 6 ký tự';
        checkout = false;
      } else if (_repasswordController.text.length < 6) {
        _errorText = 'Mật khẩu xác nhận phải có ít nhất 6 ký tự';
        checkout = false;
      } else if (_passwordController.text.trim() !=
          _repasswordController.text.trim()) {
        _errorText = 'Mật khẩu xác nhận không đúng';
        checkout = false;
      }
    });
    return checkout;
  }

  Future<void> _register() async {
    bool checkout = validateInput();
    if (checkout) {
      try {
        // Register user with email and password
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        User? currentUser = userCredential.user;

        if (currentUser != null) {
          Provider.of<UserProvider>(context, listen: false).fetchUserId();
          DateTime now = DateTime.now();

          // After successful registration, save additional user data to Firestore
          await _firestore
              .collection('users')
              .doc(userCredential.user?.uid)
              .set({
            'id': Provider.of<UserProvider>(context, listen: false).userId,
            'name': _nameController.text.trim(),
            'email': _emailController.text.trim(),
            'birthday': "${now.year}-${now.month}-${now.day}",
            'address': "",
            'image':
                "https://drive.google.com/uc?id=1MJo1yoE4mUXqBwp8zFuLDLLhrAHwmvEE",
            'phoneNum': "",
            'active': true,
            'country': "",
            'description': "",
            'vip': false,
          });
        }

        // // Retrieve the user document from Firestore after registration
        // DocumentSnapshot userDoc = await _firestore
        //     .collection('users')
        //     .doc(userCredential.user?.uid)
        //     .get();

        // if (userDoc.exists) {
        //   // Safely retrieve the data from Firestore and cast it correctly
        //   var userData = userDoc.data() as Map<String, dynamic>;

        //   // Optionally print or use the data
        //   print('User name: ${userData['name']}');
        //   print('User email: ${userData['email']}');
        //   print('Created At: ${userData['createdAt']}');
        // }

        // Show success message
        if (_saveAccount == true) {
          _secureStorageService.saveCredentials(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );

        // Navigate to home or login screen
      } catch (e) {
        print('Registration failed: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: ${e.toString()}')),
        );
      }
    }
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
          'Đăng ký',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                          label: "Nhập tên",
                          icon: Icons.person,
                          controller: _nameController,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: LoginInput(
                          label: "Nhập email",
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
                          controller: _passwordController,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Nhập lại mật khẩu",
                            suffixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                          ),
                          controller: _repasswordController,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              onPressed: _register,
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
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: ElevatedButton.icon(
                      //         onPressed: () {},
                      //         label: Text(
                      //           "Đăng nhập bằng Google",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         icon: Icon(
                      //           Icons.person,
                      //           color: Colors.black,
                      //         ),
                      //         style: ElevatedButton.styleFrom(
                      //             backgroundColor: Color(0xFFEEEEEE),
                      //             elevation: 5),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Bạn đã có tài khoản?"),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              child: Text(
                                "Đăng nhập",
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
