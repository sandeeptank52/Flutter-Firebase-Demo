import 'package:flutter/material.dart';
import 'package:flutter_projects/models/news.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String dis;

  NewsTile(this.title, this.dis);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(dis),
      ),
    );
  }
}
