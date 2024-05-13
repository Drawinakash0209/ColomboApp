import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_final/firebase_auth_implementation/firebase_auth_services.dart';

import '../pallate.dart';
import '../widgets/backgound-image.dart';
import 'home_screen.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    child: Center(
                      child: Text(
                        'Colombo Diaries',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Na',
                                border:
                                    InputBorder.none, // Remove default border
                                contentPadding: EdgeInsets.symmetric(
                                  vertical:
                                      15.0, // Adjust padding for TextInput look
                                  horizontal: 10.0,
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: 'Emai',
                                border:
                                    InputBorder.none, // Remove default border
                                contentPadding: EdgeInsets.symmetric(
                                  vertical:
                                      15.0, // Adjust padding for TextInput look
                                  horizontal: 10.0,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                            TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: 'Password',
                                border:
                                    InputBorder.none, // Remove default border
                                contentPadding: EdgeInsets.symmetric(
                                  vertical:
                                      15.0, // Adjust padding for TextInput look
                                  horizontal: 10.0,
                                ),
                              ),
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                            ),
                            TextField(
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: 'Confirm Password',
                                border:
                                    InputBorder.none, // Remove default border
                                contentPadding: EdgeInsets.symmetric(
                                  vertical:
                                      15.0, // Adjust padding for TextInput look
                                  horizontal: 10.0,
                                ),
                              ),
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextButton(
                                onPressed: () {
                                  _signup();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  child: Text('Sign up', style: kBodyText),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _signup() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print('Sign up successful');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print(email);
      print('Sign up failed');
    }
  }
}
