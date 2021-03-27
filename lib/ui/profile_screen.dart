import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/services/auth_service.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Email \n" + FirebaseAuth.instance.currentUser.email ?? 'name',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            TextButton(
                onPressed: () {
                  context.read<AuthService>().signOut();
                },
                child: Text("log out ",
                    style: TextStyle(
                      fontSize: 20.0,
                    )))
          ],
        ),
      ),
    );
  }
}
