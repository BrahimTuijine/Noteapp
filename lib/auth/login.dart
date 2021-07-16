import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  String? username, password;
  UserCredential? userCredential;

  singIn() async {
    if (formstate.currentState!.validate()) {
      formstate.currentState!.save();
      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: "$username", password: "$password");
          return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: 'ERROR',
            desc: 'No user found for that email.',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: 'ERROR',
            desc: 'Wrong password provided for that user.',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                "images/login.png",
                height: 150,
                width: 150,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        username = val;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "username can't be empty !!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.supervisor_account),
                          hintText: "username",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        password = val;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Password can't be empty !!";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: "password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Text("if you haven't an account "),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed("signup");
                            },
                            child: Text(
                              "Click here",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () async {
                          var respense = await singIn();
                          if (respense != null) {
                            Navigator.of(context).pushReplacementNamed("homepage");
                          }else{
                            print("not valid ");
                          }
                        },
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
        ),
      ),
    ));
  }
}
