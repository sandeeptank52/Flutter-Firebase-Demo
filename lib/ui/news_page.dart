import 'package:flutter/material.dart';
import 'package:flutter_projects/services/auth_service.dart';
import 'package:flutter_projects/ui/all_news_screen.dart';
import 'package:flutter_projects/ui/profile_screen.dart';
import 'package:flutter_projects/ui/sport_news_screen.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _bodyScreens = <Widget>[AllNews(), SportsNews(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("news"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthService>().signOut();
            },
            icon: Icon(Icons.ac_unit),
          )
        ],
      ),
      body: _bodyScreens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.event), title: Text("All News")),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_run), title: Text("Sport News")),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), title: Text("Profile"))
        ],
        onTap: _onTap,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
