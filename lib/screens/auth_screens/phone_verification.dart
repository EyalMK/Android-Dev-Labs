import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:android_lab_exercises/components/texts/screen_title.dart';
import 'package:android_lab_exercises/screens/auth_screens/two_factor_auth.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final TextEditingController _controller = TextEditingController();
  final PhoneNumber _number = PhoneNumber(isoCode: 'IL'); // Default to Israel
  String _rawPhoneNumber = '';

  void _submit() {
    if (_rawPhoneNumber.replaceAll(RegExp(r'\D'), '') == '0522628803') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TwoFactorAuth()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Illegal Phone Number.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Image.network(
              "https://img.freepik.com/free-vector/enter-otp-concept-illustration_114360-7897.jpg?t=st=1746372144~exp=1746375744~hmac=8b3bbe61caa899d24d695efb8fb4932516641596c586c55757998b44e98f6e4a&w=1380",
              height: 200,
            ),
            const SizedBox(height: 20),
            const ScreenTitle("Phone Verification"),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "We need to register your phone before getting started!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  _rawPhoneNumber = number.phoneNumber ?? '';
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                selectorTextStyle: const TextStyle(color: Colors.black),
                textFieldController: _controller,
                inputDecoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone Number",
                ),
                initialValue: _number,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submit,
              child: const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
