import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final bool enableObscurance;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;

  const CustomTextFormField({
    required this.label,
    required this.enableObscurance,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    super.key
  });


  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.enableObscurance;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.enableObscurance
            ? GestureDetector(
          onTap: _toggleObscureText,
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        )
            : widget.suffixIcon,
      ),
      validator: widget.validator,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
    );
  }
}