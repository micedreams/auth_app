import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'landing.dart';
import 'login.dart';
import 'signup.dart';
import 'home.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Auth",
      debugShowCheckedModeBanner: false,
      home: Landing(),
      routes: {
        Signup.routeName: (ctx) => Signup(),
        Login.routeName: (ctx) => Login(),
        Home.routeName: (ctx) => Home(),
      },
    );
  }
}