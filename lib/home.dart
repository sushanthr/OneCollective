import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      child: PlatformText('Log Out'),
      onPressed: () {
        FirebaseAuth.instance.signOut();
        GoogleSignInButtonState.instance.signOut();
        Future.microtask(() {
          Navigator.pop(context);
        });
      },
    );
  }
}
