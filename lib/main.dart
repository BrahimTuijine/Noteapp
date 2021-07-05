import 'package:flutter/material.dart';
import 'package:noteapp/auth/login.dart';
import 'package:noteapp/auth/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: Colors.blue),
          ),
          textTheme: TextTheme(
              headline6: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ))),
      home: Login(),
      routes: {
        "login": (context) => Login(),
        "signup": (context) => Test(),
      },
    );
  }
}
