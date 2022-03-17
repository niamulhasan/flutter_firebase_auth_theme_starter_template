import 'package:flutter/material.dart';

class UiUtils {
  static String themeAsset(
      {required BuildContext context, required String assetLocation}) {
    return 'assets/${Theme.of(context).brightness == Brightness.dark ? "dark" : "light"}/$assetLocation';
  }
}
