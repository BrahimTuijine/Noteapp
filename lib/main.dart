import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/C,R,U,D/addnotes.dart';
import 'package:noteapp/auth/login.dart';
import 'package:noteapp/auth/signup.dart';
import 'package:noteapp/home/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          buttonColor: Colors.blue,
          primaryColor: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: (RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),  
          ),
          textTheme: TextTheme(
              headline6: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ))),
      home: HomePage(),
      routes: {
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "homepage": (context) => HomePage(),
        "addnotes": (context) => AddNotes(),
      },
    );
  }
}
