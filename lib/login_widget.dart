import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:one_collective/apple_sign_in.dart';
import 'package:one_collective/gradient_text.dart';
import 'package:one_collective/extension_color.dart';
import 'package:one_collective/google_sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          Column(
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 10.0),
                child: const Image(
                    image: AssetImage(
                        "assets/images/OneCollectiveTransparent.png")),
              ),
              GradientText(AppLocalizations.of(context)!.one_collective,
                  style: Theme.of(context).textTheme.headline1,
                  gradient: logoGradient),
            ],
          ),
          const Spacer(flex: 1),
          Column(children: const [
            GoogleSignInButton(),
            AppleSignInButton(),
          ]),
          const Spacer(flex: 1),
        ]),
      ),
    );
  }
}
