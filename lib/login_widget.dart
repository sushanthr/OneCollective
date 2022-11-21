import 'package:flutter/material.dart';
import 'package:one_collective/gradient_text.dart';
import 'package:one_collective/extension_color.dart';

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
              flex: 3,
              child: Column(
                children: [
                  const Image(
                      image: AssetImage("assets/OneCollectiveTransparent.png")),
                  GradientText("One Collective",
                      style: Theme.of(context).textTheme.headline1,
                      gradient: logoGradient),
                ],
              )),
        ]),
      ),
    );
  }
}
