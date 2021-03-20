import 'package:flutter/material.dart';
import 'package:flutter_projects/ui/login_page.dart';
import 'package:flutter_projects/ui/signup_page.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool _isNeedToShowLogin = true;

  void updateViews() {
    setState(() {
      _isNeedToShowLogin = !_isNeedToShowLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isNeedToShowLogin) {
      return Login(updateViews: updateViews);
    } else {
      return SignUp(updateViews: updateViews);
    }
  }
}
