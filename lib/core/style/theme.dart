import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w900,
      ),
    ),
    textTheme: getTextTheme(),
  );

  static getTextTheme() {
    return TextTheme(
      headline1: GoogleFonts.balooThambi2(
        fontSize: 30,
        height: 0.9,
        fontWeight: FontWeight.w500,
        color: AppColor.gray02,
      ),
      headline2: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
      headline3: TextStyle(
        color: AppColor.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: AppColor.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 13.0,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: const TextStyle(
        fontSize: 14.0,
        fontFamily: 'Hind',
      ),
    );
  }
}
