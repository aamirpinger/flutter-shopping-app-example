import 'package:flutter/material.dart';

abstract class CustomTheme {
  static final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.teal.shade900,
      colorScheme: ColorScheme.light(secondary: Colors.tealAccent),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.teal.shade900,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Colors.grey,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // if you need this
          side: BorderSide(
            color: Colors.tealAccent,
            width: 1,
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.grey.shade700,
        ),
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.teal.shade900,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
          color: Colors.teal.shade900,
        ),
      ));
}
