import 'package:flutter/material.dart';
import 'package:flutter_projects/services/auth_service.dart';
import 'package:flutter_projects/shared/loding_view.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final Function updateViews;

  Login({this.updateViews});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingView()
        : Scaffold(
            body: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 40.0),
                        child: Expanded(
                          child: Container(
                              child: Text(
                            "log in",
                            style: TextStyle(
                                fontSize: 30.0, color: Color(0xFF464442)),
                          )),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 40.0),
                      child: Text("welcome back",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(54, 48, 48, 0.5))),
                    ),
                    Container(
                      padding: EdgeInsets.all(34.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                validator: (value) =>
                                    (value.isEmpty) ? "enter an email." : null,
                                controller: emailController,
                                decoration: InputDecoration(
                                    labelText: 'email',
                                    labelStyle: TextStyle(
                                        fontSize: 15.0,
                                        color:
                                            Color.fromRGBO(54, 48, 48, 0.5))),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                validator: (value) => (value.length < 8)
                                    ? "password must be 8+ char long."
                                    : null,
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: 'password',
                                    labelStyle: TextStyle(
                                        fontSize: 15.0,
                                        color:
                                            Color.fromRGBO(54, 48, 48, 0.5))),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 142.0),
                              child: RawMaterialButton(
                                fillColor: Color(0xFF464442),
                                splashColor: Color.fromRGBO(54, 48, 48, 0.5),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 13.0,
                                      bottom: 13.0,
                                      left: 87.0,
                                      right: 87.0),
                                  child: Text(
                                    "log in",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    context.read<AuthService>().signIn(
                                        emailController.text.toString(),
                                        passwordController.text.toString());
                                  } else {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                },
                                shape: const StadiumBorder(),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16.0),
                              child: InkWell(
                                child: Text(
                                  "sign up",
                                  style: TextStyle(
                                      color: Color(0xFF363030),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  // Navigator.pushNamed(context, '/login');
                                  widget.updateViews();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
