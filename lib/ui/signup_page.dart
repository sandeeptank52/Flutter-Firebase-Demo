import 'package:flutter/material.dart';
import 'package:flutter_projects/services/auth_service.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: Row(
                    children: [
                      Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: false,
                        child: FlatButton(
                            onPressed: () => {Navigator.maybePop(context)},
                            child: Image(
                              height: 25.0,
                              image:
                                  AssetImage('assets/icons/ArrowLeftPoint.png'),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "sign up",
                                style: TextStyle(
                                    fontSize: 30.0, color: Color(0xFF464442)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: false,
                        child: FlatButton(
                          onPressed: () => {},
                          child: Icon(Icons.arrow_back),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: Text("create account here",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromRGBO(54, 48, 48, 0.5))),
                ),
                Container(
                  padding: EdgeInsets.all(34.0),
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'first name',
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(54, 48, 48, 0.5))),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'last name',
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(54, 48, 48, 0.5))),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: 'email',
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(54, 48, 48, 0.5))),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                              labelText: 'password',
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(54, 48, 48, 0.5))),
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
                            context.read<AuthService>().signUp(
                                emailController.text.toString(),
                                passwordController.text.toString());
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
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
