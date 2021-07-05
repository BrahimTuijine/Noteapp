import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset("images/login.png",height: 150, width: 150,)
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.supervisor_account),
                      hintText: "username",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: "password",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("if you haven't an account "),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "click here",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
