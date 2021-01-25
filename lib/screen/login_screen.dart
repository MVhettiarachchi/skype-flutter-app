import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skype_app/resources/firebase_repository.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScrrenState createState() => _LoginScrrenState();
}

class _LoginScrrenState extends State<LoginScreen> {
  FirebasebaseRepository _repository = FirebasebaseRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginButton(),
    );
  }

  Widget loginButton() {
    return FlatButton(
      padding: EdgeInsets.all(35),
      child: Text(
        "LOGIN",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
        ),
      ),
      onPressed: () => performLogin(),
    );
  }

  void performLogin() {
    _repository.signIn().then((user) {
      if (user != null) {
        authenticateUser(user);
      } else {
        print('error is occured');
      }
    });
  }

  void authenticateUser(FirebaseUser user) {
    _repository.authenticateUser(user).then((isNewUser) {
      if (isNewUser) {
        _repository.addDataToDb(user).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        });
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      }
    });
  }
}
