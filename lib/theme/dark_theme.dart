import 'package:flutter/material.dart';
ThemeData darkTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: const Color(0xFFFF5722),
    primaryColorDark: const Color(0xFFD84315),
    brightness: Brightness.dark,
    hintColor: const Color(0xFF9F9F9F),
    secondaryHeaderColor: const Color(0xFF882200),
    scaffoldBackgroundColor: const Color(0xFF656565),
    cardColor: const Color(0xFF494949),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF5722),

        secondary: Color(0xFF2195F1),
        secondaryContainer: Color(0xFF2B2B2C),
        error: Color(0xFFE84D4F)),
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFFFF5722))),

    textTheme: const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF868686)),
      displayMedium: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF868686)),
      displaySmall: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF868686)),
      bodyLarge: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF868686)),

    )
);
