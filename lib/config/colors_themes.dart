import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStyleConfig {
  static double radius = 16.0;
}

class MyColors {
  static Color primary = Color(0xfff37a25);
  static Color primaryDeep = Color(0xff7F265B);
  static Color textBody = Color.fromARGB(255, 31, 28, 28);
  static Color lightYellowBG = Color(0xffFFE6C9);
  static Color midYellowBG = Color(0xffF7D5BA);
}

class MyThemeData {
  static ThemeData lightYellowTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.primary,
        foregroundColor: MyColors.textBody,
      ),
      // textTheme: TextTheme(
      //   headline1: TextStyle(
      //     fontSize: 38.0,
      //     color: MyColors.primaryDeep,
      //     fontWeight: FontWeight.w300,
      //   ),
      // ),
      tabBarTheme: TabBarTheme(
        labelColor: MyColors.textBody,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: MyColors.textBody,
              width: 2.0,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: MyColors.primary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: MyColors.primary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MyColors.midYellowBG,
        labelStyle: TextStyle(
          color: MyColors.textBody,
        ),
        border: const OutlineInputBorder(
            // borderRadius: BorderRadius.all(Radius.circular(AppStyleConfig.radius)),
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryDeep.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryDeep),
        ),
      ),
    );
  }

  static ThemeData darkYellowTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        foregroundColor: MyColors.primary,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: MyColors.primary,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: MyColors.primary,
              width: 2.0,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: MyColors.primary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MyColors.primary.withOpacity(0.5),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        border: const OutlineInputBorder(
            // borderRadius: BorderRadius.all(Radius.circular(AppStyleConfig.radius)),
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.midYellowBG.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryDeep),
        ),
      ),
    );
  }
}
