import 'package:flutter/material.dart';
import 'package:third_lab_revised/components/forms/single_input_form.dart';
import 'package:third_lab_revised/components/texts/screen_title.dart';
import 'package:third_lab_revised/screens/auth_screens/two_factor_auth.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  void _submit(Map<String, dynamic> formData) {
    final phoneNumber = formData['phoneNumber'] ?? '';

    if (phoneNumber == '0522628803') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TwoFactorAuth()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Illegal Phone Number.'),
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
              SizedBox(height: 100),
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
              SingleInputAuthForm(_submit, "Phone"),
            ]
        ),
    );
  }
}