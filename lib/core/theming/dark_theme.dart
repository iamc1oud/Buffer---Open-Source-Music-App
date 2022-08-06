import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef AppFont<TextStyle> = GoogleFonts;

class DarkTheme {
  static getTheme() => ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: const Color.fromARGB(255, 15, 3, 17),
      brightness: Brightness.dark,
      primaryTextTheme: TextTheme(
        // Headlines
        headline1: AppFont.openSans(color: Colors.white),
        headline2: AppFont.openSans(color: Colors.white),
        headline3: AppFont.openSans(color: Colors.white),
        headline4: AppFont.openSans(color: Colors.white),
        headline5: AppFont.openSans(color: Colors.white),
        headline6: AppFont.openSans(color: Colors.white),

        // Body
        bodyText1: AppFont.openSans(color: Colors.white),
        bodyText2: AppFont.openSans(color: Colors.white),
      ),
      // App Bar Theme
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent.withOpacity(0.0), elevation: 0),

      /// Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green, foregroundColor: Colors.white));
}
