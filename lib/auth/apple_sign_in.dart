import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../home.dart';
import '../utility/error_flushbar.dart';

class AppleSignInButton extends StatefulWidget {
  const AppleSignInButton({super.key});

  @override
  State<AppleSignInButton> createState() => _AppleSignInButtonState();
}

class _AppleSignInButtonState extends State<AppleSignInButton> {
  String? _errorMessage;
  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      final String errorMessage = _errorMessage.toString();
      showErrorFlushbar(context,
          AppLocalizations.of(context)!.error_sign_in_with_apple, errorMessage);
      _errorMessage = null;
    }
    if (FirebaseAuth.instance.currentUser != null) {
      Future.microtask(() => Navigator.push(
          context,
          platformPageRoute(
              context: context,
              builder: (BuildContext context) => const Home())));
    }
    return FutureBuilder<bool>(
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          return IntrinsicWidth(
              child: SignInWithAppleButton(
            onPressed: () {
              initiateSignInWithApple();
            },
            text: AppLocalizations.of(context)!.sign_in_with_apple,
            height: 55,
          ));
        } else {
          return Container();
        }
      },
      future: SignInWithApple.isAvailable(),
    );
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String _generateNonce([int length = 32]) {
    const String charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final Random random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String _sha256ofString(String input) {
    final List<int> bytes = utf8.encode(input);
    final Digest digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> initiateSignInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final String rawNonce = _generateNonce();
    final String nonce = _sha256ofString(rawNonce);
    try {
      final AuthorizationCredentialAppleID credential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName
        ],
        nonce: nonce,
      );
      // Create an `OAuthCredential` from the credential returned by Apple.
      final OAuthCredential oauthCredential =
          OAuthProvider('apple.com').credential(
        idToken: credential.identityToken,
        rawNonce: rawNonce,
      );
      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      setState(() {
        // Not state to set but we want to cause a rebuid so that this page
        // is navigated away.
      });
    } catch (e) {
      final SignInWithAppleAuthorizationException exception =
          e as SignInWithAppleAuthorizationException;
      if (exception.code != AuthorizationErrorCode.canceled)
        setState(() {
          _errorMessage = e.toString();
        });
    }
  }
}
