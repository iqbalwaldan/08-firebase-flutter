// Moh. Iqbal Waldan
// MI-2F
// 2031710139

import 'package:flutter/material.dart';
import 'package:firebase_flutter/Page/login_page.dart';
import 'package:firebase_flutter/Services/my_firebase.dart';
import 'package:firebase_flutter/Widget/button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key, this.email}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moh. Iqbal Waldan (2031710139)"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.blue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                email,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Button(
                title: 'Sign Out',
                textColor: Colors.white,
                backgroundColor: Colors.purple,
                borderColor: Colors.transparent,
                radius: 40,
                action: () {
                  MyFirebase.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }), ModalRoute.withName('/'));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
