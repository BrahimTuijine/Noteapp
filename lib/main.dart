import 'package:flutter/material.dart';
import 'package:noteapp/C,R,U,D/addnotes.dart';
import 'package:noteapp/auth/login.dart';
import 'package:noteapp/auth/signup.dart';
import 'package:noteapp/home/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.red),
          primaryColor: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: (RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
          ),
          buttonColor: Colors.blue,
          textTheme: TextTheme(
              headline6: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ))),
      home: Login(),
      routes: {
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "homepage": (context) => HomePage(),
        "addnotes": (context) => AddNotes(),
      },
    );
  }
}
