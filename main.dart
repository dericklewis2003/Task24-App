import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the home screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 24',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(), // Set HomeScreen as the default screen
    );
  }
}
