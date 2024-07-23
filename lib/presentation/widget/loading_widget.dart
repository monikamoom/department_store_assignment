import 'package:flutter/material.dart';

class LoadingDialog {
  static void show({
    required BuildContext context,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void dismiss({required BuildContext context}) {
    Navigator.pop(context);
  }
}
