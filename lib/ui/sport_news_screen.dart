import 'package:flutter/material.dart';
import 'package:flutter_projects/models/sport_news.dart';
import 'package:provider/provider.dart';
import 'news_tile.dart';

class SportsNews extends StatefulWidget {
  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  @override
  Widget build(BuildContext context) {
    final list = context.watch<List<SportNews>>();
    if (list == null || list.length == 0) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return NewsTile(list[index].title, list[index].disc);
        },
      );
    }
  }
}
