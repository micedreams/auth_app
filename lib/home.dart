import 'package:flutter/material.dart';

class Home extends StatefulWidget {
static const routeName = '/Home';

  @override
  State<StatefulWidget> createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome"),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            new Text("helloworld"),
            new RaisedButton(
              child: new Text("Logout", style: new TextStyle(fontSize: 20.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}