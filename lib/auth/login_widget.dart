import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../utility/extension_color.dart';
import '../utility/gradient_text.dart';
import 'apple_sign_in.dart';
import 'google_sign_in.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LinearGradient logoGradient = LinearGradient(colors: [
      HexColor.fromHex('5151C6'),
      HexColor.fromHex('888BF4'),
    ]);
    return PlatformScaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(children: [
          const Spacer(),
          Column(
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 10.0),
                child: const Image(
                    image: AssetImage(
                        'assets/images/OneCollectiveTransparent.png')),
              ),
              GradientText(AppLocalizations.of(context)!.one_collective,
                  style: const TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Manrope',
                  ),
                  gradient: logoGradient),
            ],
          ),
          const Spacer(),
          Column(children: const [
            GoogleSignInButton(),
            AppleSignInButton(),
          ]),
          const Spacer(),
        ]),
      ),
    );
  }
}
