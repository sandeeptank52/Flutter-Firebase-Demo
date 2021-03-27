import 'package:flutter/material.dart';
import 'package:flutter_projects/services/auth_service.dart';
import 'package:flutter_projects/shared/loading_view.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final Function updateViews;

  SignUp({this.updateViews});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

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
                            child: Text(
                          "sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30.0, color: Color(0xFF464442)),
                        ))),
                    Container(
                      margin: EdgeInsets.only(top: 40.0),
                      child: Text("create account here",
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
                            TextFormField(
                              validator: (value) =>
                                  (value.isEmpty) ? "enter first name." : null,
                              controller: fNameController,
                              decoration: InputDecoration(
                                  labelText: 'first name',
                                  labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Color.fromRGBO(54, 48, 48, 0.5))),
                            ),
                            TextFormField(
                              validator: (value) =>
                                  (value.isEmpty) ? "enter last name." : null,
                              controller: lNameController,
                              decoration: InputDecoration(
                                  labelText: 'last name',
                                  labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Color.fromRGBO(54, 48, 48, 0.5))),
                            ),
                            TextFormField(
                              validator: (value) =>
                                  (value.isEmpty) ? "enter an email." : null,
                              controller: emailController,
                              decoration: InputDecoration(
                                  labelText: 'email',
                                  labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Color.fromRGBO(54, 48, 48, 0.5))),
                            ),
                            TextFormField(
                              validator: (value) => (value.length < 8)
                                  ? "password must be 8+ char long."
                                  : null,
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  labelText: 'password',
                                  labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Color.fromRGBO(54, 48, 48, 0.5))),
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
                                      left: 81.0,
                                      right: 81.0),
                                  child: Text(
                                    "sign up",
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
                                    context.read<AuthService>().signUp(
                                        fNameController.text.toString(),
                                        lNameController.text.toString(),
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
                                  "log in",
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
