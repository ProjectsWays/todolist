import 'package:flutter/material.dart';

import 'body.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String _username;
  String _password;
  bool _showPassword = false;
  bool _showErrorMessage = false;

  get username => _username;
  set username(value) => _username = value;

  get password => _password;
  set password(value) => _password = value;

  get showPassword => _showPassword;
  set showPassword(value) {
    setState(() {
      _showPassword = value;
    });
  }

  get showErrorMessage => _showErrorMessage;
  set showErrorMessage(value) {
    setState(() {
      _showErrorMessage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: Body(state: this),
        ),
      ),
    );
  }
}
