import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AppleSignInButton extends StatefulWidget {
  const AppleSignInButton({super.key});

  @override
  State<AppleSignInButton> createState() => _AppleSignInButtonState();
}

class _AppleSignInButtonState extends State<AppleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: SignInWithAppleButton(
        onPressed: () {
          print("hee");
          initiateSignInWithApple();
        },
        text: AppLocalizations.of(context)!.sign_in_with_apple,
        height: 55,
      ),
    );
  }

  void initiateSignInWithApple() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    print(credential);
  }
}
