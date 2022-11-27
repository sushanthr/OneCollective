import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../home.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  GoogleSignInButtonState createState() => GoogleSignInButtonState.instance;
}

class GoogleSignInButtonState extends State<GoogleSignInButton> {
  GoogleSignInButtonState._privateConstructor();
  static final GoogleSignInButtonState instance =
      GoogleSignInButtonState._privateConstructor();

  bool _isSigningIn = false;
  bool _isSignedIn = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleSignInAccount;

  void signOut() {
    _googleSignIn.signOut();
    setState(() {
      _isSignedIn = false;
      _isSigningIn = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      setState(() {
        _googleSignInAccount = account;
      });
      try {
        if (_googleSignInAccount != null) {
          final User? user = await _signIntoFirebase(_googleSignInAccount!);
          if (user != null) {
            setState(() {
              _isSignedIn = true;
            });
          }
        }
      } catch (e) {
        // Todo: Find cross platform way of showing snack bar error messages.
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<User?> _signIntoFirebase(
      GoogleSignInAccount googleSignInAccount) async {
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredentials =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredentials.user;
  }

  @override
  Widget build(BuildContext context) {
    if (_isSignedIn) {
      Future.microtask(() => {
            Navigator.push(
                context,
                platformPageRoute(
                    context: context,
                    builder: (BuildContext context) => const Home()))
          });
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });
                try {
                  await _googleSignIn.signIn();
                } catch (e) {
                  // TODO: Find a cross platform snackbar solution.
                }
                setState(() {
                  _isSigningIn = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                      image: AssetImage('assets/images/google_logo.png'),
                      height: 35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        AppLocalizations.of(context)!.sign_in_with_google,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
