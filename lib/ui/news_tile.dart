import 'package:flutter/material.dart';
import 'package:flutter_projects/models/news.dart';

class NewsTile extends StatelessWidget {
  final News news;

  NewsTile(this.news);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
      child: ListTile(
        title: Text(news.title),
        subtitle: Text(news.disc),
      ),
    );
  }
}
