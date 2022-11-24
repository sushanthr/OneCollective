import 'package:flutter/material.dart';
import 'package:one_collective/gradient_text.dart';
import 'package:one_collective/extension_color.dart';
import 'package:one_collective/google_sign_in_button.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LinearGradient logoGradient = LinearGradient(colors: [
      HexColor.fromHex("5151C6"),
      HexColor.fromHex("888BF4"),
    ]);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Spacer(flex: 1),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  const Image(
                      image: AssetImage(
                          "assets/images/OneCollectiveTransparent.png")),
                  GradientText("One Collective",
                      style: Theme.of(context).textTheme.headline1,
                      gradient: logoGradient),
                ],
              )),
          const Spacer(flex: 1),
          const GoogleSignInButton(),
          IntrinsicWidth(
            child: SignInWithAppleButton(
              onPressed: () {
                print("Sign in");
              },
              height: 55,
            ),
          ),
          const Spacer(flex: 1),
        ]),
      ),
    );
  }
}
