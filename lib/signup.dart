import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
import 'home.dart';

class Signup extends StatefulWidget {
  static const routeName = '/Signup';
  @override
  State<StatefulWidget> createState() => new _SignupState();
}

class _SignupState extends State<Signup> {
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
        User user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email,
                password: _password,)).user;
        if(user != null){
          Navigator.of(context).pushNamed(Home.routeName);
        }
      } catch (e) {
        print(e);
        _password = "";
        _email = "";
        // TODO: alertdialog with error
      }
    }
  }

  @override
  Widget build(context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Signup"),
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
                    child: new Text("Signup",
                        style: new TextStyle(fontSize: 20.0)),
                    onPressed: validateAndSubmit,
                  ),
                  new FlatButton(
                    child:
                        new Text("login", style: new TextStyle(fontSize: 20.0)),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Login.routeName);
                    },
                  ),
                ],
              ))),
    );
  }
}
