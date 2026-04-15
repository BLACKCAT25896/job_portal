import 'package:flutter/material.dart';
import 'package:mighty_job/util/styles.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Roboto',
    primaryColor: const Color(0xFFFD5622),
  brightness: Brightness.light,
  cardColor: const Color(0xFFFFFFFF),
  secondaryHeaderColor: const Color(0xFF882200),
  hintColor: const Color(0xFFABABAB),
  scaffoldBackgroundColor: const Color(0xFFF1F4F8),
    primaryColorDark: const Color(0xFF952400),
    primaryColorLight: const Color(0xFFFFF7F3),


  colorScheme: const ColorScheme.light(
    primary: Color(0xFFFF5722),
    secondaryContainer: Color(0xFFFDFDFE),
    error: Color(0xFFE11515),
    secondary: Color(0xFF2195F1),
    onSecondary: Color(0xFF616161),
    tertiary: Color(0xFFF5F5F5),
    outline: Color(0xFFEEEEEE),
    surfaceContainer: Color(0xFF212121),

  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFFFF5722))),
  textTheme: TextTheme(
    displaySmall: textRegular.copyWith(color: const Color(0xFF6B7280))
  )
);
