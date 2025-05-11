import 'package:flutter/material.dart';
import 'package:third_lab_revised/screens/dashboard.dart';
import 'package:third_lab_revised/screens/auth_screens/phone_verification.dart';

import '../../components/forms/digit_2fa_form.dart';
import '../../components/texts/screen_title.dart';

class TwoFactorAuth extends StatefulWidget {
  const TwoFactorAuth({super.key});

  @override
  State<TwoFactorAuth> createState() => _TwoFactorAuthState();
}

class _TwoFactorAuthState extends State<TwoFactorAuth> {
  void _navigateToPhoneVerification() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PhoneVerification())
    );
  }

  void _submit(Map<String, dynamic> formData) {
    final code = formData['code'] ?? '';

    if (code == '123456') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ),
            (Route<dynamic> route) => false,
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid code.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(
            children: [
              Image.network("https://img.freepik.com/free-vector/enter-otp-concept-illustration_114360-7897.jpg?t=st=1746372144~exp=1746375744~hmac=8b3bbe61caa899d24d695efb8fb4932516641596c586c55757998b44e98f6e4a&w=1380"),
              SizedBox(height: 20),
              ScreenTitle("Phone Verification"),
              SizedBox(height: 10),
              Text(
                "We need to register your phone before getting started!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 40),
              DigitTwoFactorAuthForm(_submit),
              InkWell(
                onTap: _navigateToPhoneVerification,
                child: Text(
                  'Edit Phone Number?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ]
        ),
    );
  }
}