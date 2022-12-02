import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utility/app_theme.dart';
import '../home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    final HomeState? homeState = context.findAncestorStateOfType<HomeState>();
    HomePage currentPage = homeState!.getHomePage();

    void switchPage(HomePage page) {
      homeState.setHomePage(page);
    }

    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        height: 75,
        color: AppTheme.instance.backgroundColor,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => switchPage(HomePage.home),
                child: SvgPicture.asset(currentPage == HomePage.home
                    ? 'assets/icons/HomeColored.svg'
                    : 'assets/icons/Home.svg'),
              ),
              GestureDetector(
                onTap: () => switchPage(HomePage.messages),
                child: SvgPicture.asset(currentPage == HomePage.messages
                    ? 'assets/icons/FourGridColored.svg'
                    : 'assets/icons/FourGrid.svg'),
              ),
              Container(width: 82),
              GestureDetector(
                onTap: () => switchPage(HomePage.notifications),
                child: SvgPicture.asset(currentPage == HomePage.notifications
                    ? 'assets/icons/BellColored.svg'
                    : 'assets/icons/Bell.svg'),
              ),
              GestureDetector(
                onTap: () => switchPage(HomePage.profile),
                child: SvgPicture.asset(currentPage == HomePage.profile
                    ? 'assets/icons/PersonColored.svg'
                    : 'assets/icons/Person.svg'),
              ),
            ]),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  double _length1 = 1;
  double _length2 = 1;

  double s1(double v) {
    return (v - 144.41) + _length1;
  }

  double s2(double v) {
    return (v - 371.418) + _length2;
  }

  @override
  Path getClip(Size size) {
    _length1 = size.width / 2 - (229.628 - 148.665) / 2;
    _length2 = size.width - (375 - 371.418);
    // d="M8 0
    // H144.41
    // C148.665 0 152.089 3.3703 153.144 7.4924
    // C157.119 23.025 170.563 35 187 35
    // C203.619 35 217.178 24.2888 220.984 7.551
    // C221.931 3.387 225.358 0 229.628 0
    // H367

    // C371.418 0 375 3.9797 375 8.8889
    // L375 75
    // H0
    // L0 8.8889
    // C0 3.9797 3.5818 0 8 0Z"
    final Path path = Path();
    path.moveTo(8, 0);
    path.lineTo(_length1, 0);
    path.cubicTo(s1(148.665), 0, s1(152.089), 3.3703, s1(153.144), 7.3924);
    path.cubicTo(s1(157.119), 23.025, s1(170.563), 35, s1(187), 35);
    path.cubicTo(s1(203.619), 35, s1(217.178), 24.2888, s1(220.984), 7.551);
    path.cubicTo(s1(221.931), 3.387, s1(225.358), 0, s1(229.628), 0);
    path.lineTo(_length2, 0);
    path.cubicTo(s2(371.418), 0, s2(375), 3.9797, s2(375), 8.8889);
    path.lineTo(s2(375), 75);
    path.lineTo(0, 75);
    path.lineTo(0, 8.8889);
    path.cubicTo(0, 3.9797, 3.5818, 0, 8, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
