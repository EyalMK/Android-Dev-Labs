import 'package:flutter/material.dart';
import 'package:third_lab_revised/components/forms/text_form_field.dart';

import '../buttons/filled_action_button.dart';

class SingleInputAuthForm extends StatefulWidget {
  final void Function(Map<String, dynamic> formData) onSubmit;
  final String fieldName;

  const SingleInputAuthForm(this.onSubmit, this.fieldName, {super.key});

  @override
  State<SingleInputAuthForm> createState() => _SingleInputAuthFormState();
}

class _SingleInputAuthFormState extends State<SingleInputAuthForm> {
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
              label: widget.fieldName,
              enableObscurance: false,
              prefixIcon: Icon(Icons.lock),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
                // String result = PasswordValidator.validatePassword(value);
                // return result.isEmpty ? null : result;
              },
              onSaved: (value) => _formData['phoneNumber'] = value!,
            ),
            SizedBox(height: 20),
            FilledActionButton("Send the code", 400, 75, Colors.green, _submit)
          ],
        ),
      ),
    );
  }
}