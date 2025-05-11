import 'package:flutter/material.dart';
import 'package:third_lab_revised/screens/welcome_screen.dart';

void main() {
  runApp(MyApp(title: "My Basic List"));
}


class MyApp extends StatelessWidget {
  final String title;

  const MyApp({super.key, required this.title});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.teal
      ),
      home: WelcomeScreen(),
    );
  }
}
