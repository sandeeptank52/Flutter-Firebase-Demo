import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/services/auth_service.dart';
import 'package:flutter_projects/ui/authentication.dart';
import 'package:flutter_projects/ui/news_page.dart';
import 'package:flutter_projects/ui/signup_page.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(accentColor: Colors.black, primaryColor: Colors.black),
        routes: {
          '/login': (context) => Login(),
          '/signup': (context) => SignUp(),
        },
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fUser = context.watch<User>();
    if (fUser != null) {
      return NewsPage();
    } else {
      return Authentication();
    }
  }
}
