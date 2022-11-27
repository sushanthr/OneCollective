import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showErrorFlushbar(
    BuildContext context, String title, String errorMessage) {
  Future.microtask(() {
    Flushbar(
      title: title,
      message: errorMessage,
      titleColor: Colors.black,
      messageColor: Colors.black,
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 3),
    ).show(context);
  });
}
