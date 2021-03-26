

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_projects/models/news.dart';

import 'news_tile.dart';

class SportsNews extends StatefulWidget {
  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  @override
  Widget build(BuildContext context) {
    final list = context.watch<List<News>>();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return NewsTile(list[index]);
      },
    );
  }
}
