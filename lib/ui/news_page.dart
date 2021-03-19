import 'package:flutter/material.dart';
import 'package:flutter_projects/services/auth_service.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("welcome to my news page"),
            RaisedButton(
              onPressed: () {
                context.read<AuthService>().signOut();
              },
              child: Text('sign out'),
            )
          ],
        ),
      ),
    );
  }
}
