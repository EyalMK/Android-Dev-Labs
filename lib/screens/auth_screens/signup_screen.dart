import 'package:android_lab_exercises/screens/auth_screens/phone_verification.dart';
import 'package:flutter/material.dart';
import 'package:android_lab_exercises/components/forms/auth_form.dart';
import 'package:android_lab_exercises/components/texts/secondary_screen_title.dart';

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

  void _navigateToPhoneLogin() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PhoneVerification())
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
          AuthForm("Sign up", _submit),
          Text(
              'or',
              style: TextStyle(
                  fontSize: 20
              )
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: _navigateToPhoneLogin,
            child: Text(
              'Sign up using phone number',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
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