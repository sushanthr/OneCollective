import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utility/extension_color.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Container(
        height: 37,
        decoration: BoxDecoration(
            color: HexColor.fromHex('F3F5F7'),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
          child: Row(children: [
            SvgPicture.asset(
              'assets/icons/Search.svg',
              width: 20,
            ),
            Expanded(
              child: PlatformTextField(
                makeCupertinoDecorationNull: true,
                hintText: AppLocalizations.of(context)!.search_hint,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'Manrope',
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
