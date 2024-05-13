import 'package:flutter/material.dart';

import '../pallate.dart';
import '../widgets/backgound-image.dart';
import '../widgets/email_input.dart';
import '../widgets/password_input.dart';
import 'home_screen.dart';
import 'sign_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                    height:  150,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Colombo Diaries',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize:  40,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:  100),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal:  40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              icon: Icons.email,
                              hint: 'Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            PasswordInput(
                              icon: Icons.lock,
                              hint: 'password',
                              inputAction: TextInputAction.done,
                            ),
                            Text(
                              'Forgot password?',
                              style: kBodyText,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height:  100,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical:  16.0),
                                  child: Text(
                                    'Login',
                                    style: kBodyText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:  20,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignPage()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical:  12.0),
                                  child: Text(
                                    'Sign up',
                                    style: kBodyText,
                                  ),
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
}
