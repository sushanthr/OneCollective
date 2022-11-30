import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'auth/login_widget.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const OneCollectiveApp());
}

class OneCollectiveApp extends StatelessWidget {
  const OneCollectiveApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      debugShowCheckedModeBanner: false,
      material: _materialAppData,
      cupertino: _cupertinoAppData,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.app_title,
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginWidget()
          : const Home(),
    );
  }

  CupertinoAppData _cupertinoAppData(
      BuildContext context, PlatformTarget platformTarget) {
    return CupertinoAppData(
        theme: const CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(fontFamily: 'ManRope'),
      navLargeTitleTextStyle: TextStyle(fontFamily: 'ManRope'),
    )));
  }

  MaterialAppData _materialAppData(
      BuildContext context, PlatformTarget platformTarget) {
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
    return MaterialAppData(
        theme: ThemeData(
      primarySwatch: MaterialColor(color[900]!.value, color),
      fontFamily: 'Manrope',
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 42.0, fontWeight: FontWeight.w800, fontFamily: 'Manrope'),
        headline2: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
        bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Manrope'),
      ),
    ));
  }
}
