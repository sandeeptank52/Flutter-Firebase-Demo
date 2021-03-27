import 'package:flutter/material.dart';
import 'package:flutter_projects/models/news.dart';
import 'package:provider/provider.dart';

import 'news_tile.dart';

class AllNews extends StatefulWidget {
  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    final list = context.watch<List<News>>();
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
