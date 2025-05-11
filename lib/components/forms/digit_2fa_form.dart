import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../buttons/filled_action_button.dart';

class DigitTwoFactorAuthForm extends StatefulWidget {
  final void Function(Map<String, dynamic> formData) onSubmit;

  const DigitTwoFactorAuthForm(this.onSubmit, {super.key});

  @override
  State<DigitTwoFactorAuthForm> createState() => _DigitTwoFactorAuthFormState();
}

class _DigitTwoFactorAuthFormState extends State<DigitTwoFactorAuthForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(_formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PinCodeTextField(
                appContext: context,
                length: 6, // 6-digit 2FA code
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.grey[200],
                  selectedFillColor: Colors.white,
                  activeColor: Colors.blue,
                  selectedColor: Colors.blue,
                  inactiveColor: Colors.grey,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (code) {
                  _formData['code'] = code;
                },
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 20),
            FilledActionButton("Verify Phone Number", 400, 75, Colors.green, _submit)
          ],
        ),
      ),
    );
  }
}