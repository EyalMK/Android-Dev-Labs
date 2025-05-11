import 'package:flutter/material.dart';

class SecondaryScreenTitle extends StatelessWidget {
  final String title;

  const SecondaryScreenTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
            color: Colors.grey
        ),
    );
  }
}