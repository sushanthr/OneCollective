import 'package:flutter/material.dart';
import 'extension_color.dart';

class AppTheme {
  AppTheme._privateConstructor();
  static final AppTheme instance = AppTheme._privateConstructor();

  final Color foregroundColor = Colors.black;
  final Color backgroundColor = Colors.white;
  final Color backgroundDimColor = HexColor.fromHex('F3F5F7');
  final String fontFamily = 'Manrope';
}
