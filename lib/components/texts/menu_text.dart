import 'package:flutter/material.dart';

class MenuText extends StatelessWidget {
  final String text;

  const MenuText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold
        )
    );
  }
}
