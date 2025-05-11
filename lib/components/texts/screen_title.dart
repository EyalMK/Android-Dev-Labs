import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;

  const ScreenTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.black,
            backgroundColor: Colors.white54
        )
    );
  }
}