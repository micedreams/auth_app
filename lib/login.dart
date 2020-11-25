import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signup.dart';
import 'home.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';
  @override
  State<StatefulWidget> createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;

  final formKey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        User user =
        (await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        )).user;
        if (user != null) {
          Navigator.of(context).pushNamed(Home.routeName);
        }
      } catch (e) {
        print(e);
        _email = "";
        _password = "";
      }
    }
  }

  @override
  Widget build(context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
      ),
      body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
              key: formKey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(labelText: "Email"),
                    validator: (value) =>
                        value.isEmpty ? "Email cant be empty" : null,
                    onSaved: (value) => _email = value,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(labelText: "Password"),
                    validator: (value) =>
                        value.isEmpty ? "Password cant be empty" : null,
                    onSaved: (value) => _password = value,
                    obscureText: true,
                  ),
                  new RaisedButton(
                    child:
                        new Text("Login", style: new TextStyle(fontSize: 20.0)),
                    onPressed: validateAndSubmit,
                  ),
                  new FlatButton(
                    child: new Text("New User?", style: new TextStyle(fontSize: 20.0)),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(Signup.routeName);
                      },
                  ),
                ],
              ))),
    );
  }
}
