import 'package:android_lab_exercises/screens/appstore.dart';
import 'package:flutter/material.dart';
import 'package:android_lab_exercises/components/screen_app_bar.dart';
import 'package:android_lab_exercises/components/buttons/white_action_button.dart';
import 'package:android_lab_exercises/components/texts/secondary_screen_title.dart';
import 'package:android_lab_exercises/screens/auth_screens/login_screen.dart';
import 'package:android_lab_exercises/screens/auth_screens/signup_screen.dart';

import '../components/buttons/filled_action_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  void _navigateToSignUp() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SignUpPage(title: "Sign Up"))
    );
  }

  void _navigateToLogin() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Login())
    );
  }

  void _navigateToApps() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AppStore())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("Welcome"),
      body: Column(
        children: [
          SizedBox(height: 10),
          SecondaryScreenTitle("Please login or sign up"),
          SizedBox(height: 40),
          Image.asset(
            "images/welcome.png",
            fit: BoxFit.contain,
          ),
          SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WhiteActionButton("Login", 400, 75, _navigateToLogin),
              SizedBox(height: 20),
              FilledActionButton("Sign up", 400, 75, Colors.blue, _navigateToSignUp),
              SizedBox(height: 50),
              FilledActionButton("Download Sponsored Apps", 300, 50, Colors.green, _navigateToApps)
            ],
          ),
        ],
      ),
    );
  }
}