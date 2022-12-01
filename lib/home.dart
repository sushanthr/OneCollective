import 'package:flutter/material.dart';

import 'components/bottom_bar.dart';
import 'components/search_bar.dart';
import 'utility/app_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
      const Positioned(bottom: 0, left: 0, right: 0, child: BottomBar())
    ]);
  }
}
