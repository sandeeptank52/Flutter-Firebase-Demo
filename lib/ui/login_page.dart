import 'package:flutter/material.dart';
import 'package:flutter_projects/services/auth_service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                      FlatButton(
                          onPressed: () => {Navigator.maybePop(context)},
                          child: Image(
                            height: 25.0,
                            image:
                            AssetImage('assets/icons/ArrowLeftPoint.png'),
                          )),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "log in",
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
                  child: Text("welcome back",
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
                          controller: passwordController,
                          obscureText: true,
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
                              debugPrint(
                                  "${emailController.text.toString()} ${passwordController.text.toString()}");
                              context.read<AuthService>().signIn(emailController.text.toString(),passwordController.text.toString());
                            },
                          shape: const StadiumBorder(),
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
