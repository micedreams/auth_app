import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

class Landing extends StatefulWidget {
static const routeName = '/Landing';

  @override
  State<StatefulWidget> createState() => new _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Auth Example"),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            new RaisedButton(
              child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
              onPressed: () {
                 Navigator.of(context).pushNamed(Login.routeName);
              },
            ),
            new RaisedButton(
              child: new Text("Signup", style: new TextStyle(fontSize: 20.0)),
              onPressed: () {
                Navigator.of(context).pushNamed(Signup.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}