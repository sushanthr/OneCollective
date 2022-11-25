import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'auth/login_widget.dart';
import 'utility/extension_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Map<int, Color> color = {
      50: Color.fromRGBO(47, 128, 237, .1),
      100: Color.fromRGBO(47, 128, 237, .2),
      200: Color.fromRGBO(47, 128, 237, .3),
      300: Color.fromRGBO(47, 128, 237, .4),
      400: Color.fromRGBO(47, 128, 237, .5),
      500: Color.fromRGBO(47, 128, 237, .6),
      600: Color.fromRGBO(47, 128, 237, .7),
      700: Color.fromRGBO(47, 128, 237, .8),
      800: Color.fromRGBO(47, 128, 237, .9),
      900: Color.fromRGBO(47, 128, 237, 1),
    };
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(color[900]!.value, color),
        fontFamily: 'Manrope',
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 42.0,
              fontWeight: FontWeight.w800,
              fontFamily: 'Manrope',
              color: HexColor.fromHex('5151c6')),
          headline2: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Manrope',
              color: HexColor.fromHex('5151c6')),
          bodyText1: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Manrope',
              color: HexColor.fromHex('5151c6')),
        ),
      ),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.app_title,
      home: const LoginWidget(),
    );
  }
}
