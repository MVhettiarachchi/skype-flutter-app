import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skype_app/resources/firebase_repository.dart';
import 'package:skype_app/screen/login_screen.dart';
import 'package:skype_app/screen/home_screen.dart';

void main() async {
  // await WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  //final Widget child;
  //const MyApp({Key key,@required this.child}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  //Future<FirebaseApp> _initialization;

  @override
  void initState() {
    // TODO: implement initState
    //_initialization = Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore.instance.collection("users").doc().set({
    //   "name":"madhu"
    // });

    FirebasebaseRepository _repository = FirebasebaseRepository();
    return MaterialApp(
      title: "Skype",
      home: Scaffold(
        body: FutureBuilder(
          future: _repository.getCurrentUser(),
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot){
            if(snapshot.hasData){
              return HomePage();
            }
            else{
              return LoginScreen();
            }
          },
        ),
      ),
      
    );
  }
}

class HomeScreen {
}