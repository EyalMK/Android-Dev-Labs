import 'package:flutter/material.dart';
import 'package:third_lab_revised/components/screen_app_bar.dart';
import 'package:third_lab_revised/components/buttons/white_action_button.dart';
import 'package:third_lab_revised/components/texts/secondary_screen_title.dart';
import 'package:third_lab_revised/screens/auth_screens/login_screen.dart';
import 'package:third_lab_revised/screens/auth_screens/signup_screen.dart';
import 'package:third_lab_revised/screens/dashboard.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("Welcome"),
      body: Column(
        children: [
          SizedBox(height: 10),
          SecondaryScreenTitle("Please login or sign up"),
          SizedBox(height: 40),
          Image.network("https://img.freepik.com/free-vector/hand-drawn-business-planning-concept_23-2149170411.jpg?t=st=1743957230~exp=1743960830~hmac=39c6bc7f96f9552f479a3cd3cae7c5241ae28cc5f3c8307723f4b93675c7ba4c&w=1380"),
          SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WhiteActionButton("Login", 400, 75, _navigateToLogin),
              SizedBox(height: 20),
              FilledActionButton("Sign up", 400, 75, Colors.blue, _navigateToSignUp)
            ],
          ),
        ],
      ),
    );
  }
}