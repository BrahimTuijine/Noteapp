import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  UserCredential? userCredential;
  String? username, password, email;

  singUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "$email",
          password: "$password",
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Error',
            desc: 'The password provided is too weak ',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Error',
            desc: 'The account already exists for that email ',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Not valid ");
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
                        username = val!;
                      },
                      validator: (val) {
                        if (val!.length > 20) {
                          return "username can't be larger then 20 char !!";
                        } else if (val.length < 2) {
                          return "username can't be less then 2 char !!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.supervisor_account),
                        hintText: "username",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        email = val!;
                      },
                      validator: (val) {
                        if (val!.length > 20) {
                          return "E-mail can't be larger then 20 char !!";
                        } else if (val.length < 2) {
                          return "E-mail can't be less then 2 char !!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "E-mail",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        password = val!;
                      },
                      validator: (val) {
                        if (val!.length > 20) {
                          return "Password can't be larger then 20 char !!";
                        } else if (val.length < 4) {
                          return "Password can't be less then 4 char !!";
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
                          Text("if you have account "),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
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
                          var respense = await singUp();

                          if (respense != null ) {
                            Navigator.of(context).pushReplacementNamed("homepage");
                          }
                        },
                        child: Text(
                          "SignUp",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
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
