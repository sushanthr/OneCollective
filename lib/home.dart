import 'package:flutter/material.dart';

import 'components/search_bar.dart';
import 'utility/app_theme.dart';
import 'utility/extension_color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.instance.backgroundColor,
      child: Column(
        children: <Widget>[
          Container(
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
    );
  }
}
