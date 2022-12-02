import 'package:flutter/material.dart';

import 'components/bottom_bar.dart';
import 'components/search_bar.dart';
import 'utility/app_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

enum HomePage { home, messages, notifications, profile }

class HomeState extends State<Home> {
  HomePage _page = HomePage.home;

  HomePage getHomePage() {
    return _page;
  }

  void setHomePage(HomePage page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
        child: Column(
          children: <Widget>[
            Container(
              color: AppTheme.instance.backgroundColor,
              height: 44,
            ),
            const SearchBar(),
            Expanded(
              child: Container(
                color: AppTheme.instance.backgroundDimColor,
              ),
            ),
          ],
        ),
      ),
      // ignore: prefer_const_constructors
      Positioned(bottom: 0, left: 0, right: 0, child: BottomBar())
    ]);
  }
}
