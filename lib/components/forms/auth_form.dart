import 'package:flutter/material.dart';
import 'package:third_lab_revised/components/forms/text_form_field.dart';
import 'package:third_lab_revised/utils/password_validator.dart';

import '../buttons/filled_action_button.dart';

class AuthForm extends StatefulWidget {
  final void Function(Map<String, dynamic> formData) onSubmit;

  const AuthForm(this.onSubmit, {super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
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
            CustomTextFormField(
              label: 'Email',
              enableObscurance: false,
              prefixIcon: Icon(Icons.email),
              validator: (value) => value == null || value.isEmpty ? 'Please enter email' : null,
              onSaved: (value) => _formData['email'] = value!,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              label: 'Password',
              enableObscurance: true,
              prefixIcon: Icon(Icons.lock),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                String result = PasswordValidator.validatePassword(value);
                return result.isEmpty ? null : result;
              },
              onSaved: (value) => _formData['password'] = value!,
            ),
            SizedBox(height: 20),
            FilledActionButton("Sign up", 400, 75, Colors.blue, _submit)
          ],
        ),
      ),
    );
  }
}