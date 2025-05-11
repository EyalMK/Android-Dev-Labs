import 'package:flutter/material.dart';
import 'package:third_lab_revised/components/forms/auth_form.dart';
import 'package:third_lab_revised/components/texts/secondary_screen_title.dart';

import '../../components/screen_app_bar.dart';
import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void _navigateToLogin() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Login())
    );
  }

  void _submit(Map<String, dynamic> formData) {
    _navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("Sign up"),
      body: Column(
        children: [
          SizedBox(height: 10),
          SecondaryScreenTitle("Create an account, it's free"),
          AuthForm(_submit),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                    fontSize: 18
                ),
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: _navigateToLogin,
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}