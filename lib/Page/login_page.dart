// Moh. Iqbal Waldan
// MI-2F
// 2031710139

import 'package:firebase_flutter/Page/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_flutter/Services/my_firebase.dart';
import 'package:firebase_flutter/Page/first_screen.dart';
import 'package:firebase_flutter/Widget/button.dart';
import 'package:firebase_flutter/Widget/form_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moh. Iqbal Waldan (2031710139)"),
      ),
      body: ListView(children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: const FlutterLogo(size: 150)),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: FormInput(label: 'Email', controller: emailController),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child:
                  FormInput(label: 'Password', controller: passwordController),
            ),
            Button(
                title: 'Sign In',
                textColor: Colors.white,
                backgroundColor: Colors.blue,
                borderColor: Colors.transparent,
                radius: 5,
                action: () async {
                  MyFirebase.signIn(
                          emailController.text, passwordController.text)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen(
                                    email: emailController.text,
                                  )));
                    }
                  });
                }),
            Button(
                title: 'Sign Up',
                textColor: Colors.white,
                backgroundColor: Colors.green,
                borderColor: Colors.transparent,
                radius: 5,
                action: () async {
                  MyFirebase.signUp(
                          emailController.text, passwordController.text)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen(
                                    email: emailController.text,
                                  )));
                    }
                  });
                }),
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "or",
                  style: TextStyle(fontSize: 20),
                )),
            Button(
                title: 'Sign In with Google',
                textColor: Colors.blue,
                backgroundColor: Colors.white,
                borderColor: Colors.blue,
                radius: 40,
                action: () {
                  MyFirebase.signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return FirstScreen(
                              imageUrl: MyFirebase.imageUrl,
                              name: MyFirebase.name,
                              email: MyFirebase.email,
                            );
                          },
                        ),
                      );
                    }
                  });
                }),
          ],
        ),
      ]),
    );
  }
}
