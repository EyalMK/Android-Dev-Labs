import 'package:android_lab_exercises/screens/auth_screens/two_factor_auth.dart';
import 'package:flutter/material.dart';
import 'package:android_lab_exercises/components/forms/auth_form.dart';
import 'package:android_lab_exercises/components/screen_app_bar.dart';
import 'package:android_lab_exercises/components/texts/secondary_screen_title.dart';
import 'package:android_lab_exercises/screens/auth_screens/phone_verification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _submit(Map<String, dynamic> formData) {
    final email = formData['email'] ?? '';
    final password = formData['password'] ?? '';

    if (email == 'test@test.com' && password == 'password!') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TwoFactorAuth()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid email or password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _navigateToPhoneLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PhoneVerification()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("Login"),
      body:
        Column(
            children: [
              SizedBox(height: 10),
              SecondaryScreenTitle("Login to your account"),
              SizedBox(height: 40),
              AuthForm("Login", _submit),
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
                  'Sign in using phone number',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 90),
              Image.asset(
                "images/login.png",
                fit: BoxFit.contain,
              )
            ]
        ),
    );
  }
}