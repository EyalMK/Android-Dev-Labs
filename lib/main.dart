import 'package:flutter/material.dart';
import 'package:android_lab_exercises/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


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
