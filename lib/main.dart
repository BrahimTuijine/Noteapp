import 'package:flutter/material.dart';
import 'package:noteapp/auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      routes: {
        "login" :(context) => Login(),
      },
    );
  }
}