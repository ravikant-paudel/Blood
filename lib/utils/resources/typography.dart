// Copyright (c) 2020 The Blood Authors. All rights reserved.

// 100: Thin
// 200: ExtraLight
// 300: Light
// 400: Regular
// 500: Medium
// 600: SemiBold
// 700: Bold
// 800: ExtraBold
// 900: Black

part  of 'theme.dart';

TextTheme bloodTextTheme = TextTheme(
  headline1: const TextStyle(
    fontSize: 96.0,
    height: 1.104,
  ),
  headline2: const TextStyle(
    fontSize: 60.0,
    height: 1.167,
  ),
  headline3: const TextStyle(
    fontSize: 48.0,
    height: 1.208,
  ),
  headline4: GoogleFonts.heebo(
    fontWeight: FontWeight.normal, // SB: w600
    fontSize: 34.0,
    height: 1.295,
  ),
  headline5: GoogleFonts.heebo(
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
    height: 1.416,
  ),
  headline6: GoogleFonts.heebo(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    height: 1.5,
  ),
  subtitle1: GoogleFonts.heebo(
    fontWeight: FontWeight.w600, // R: normal
    fontSize: 16.0,
    height: 1.625,
  ),
  subtitle2: const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.571,
  ),
  bodyText1: const TextStyle(
    fontWeight: FontWeight.w600, // M-I: w600 , B-I: bold
    fontSize: 14.0,
    height: 1.571,
  ),
  bodyText2: const TextStyle(
    fontSize: 14.0,
    height: 1.571,
  ),
  button: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14.0, // 16: 16.0
    height: 1.571, // 16: 1.5
  ),
  caption: const TextStyle(
    fontWeight: FontWeight.normal, // M: w600
    fontSize: 12.0,
    height: 1.667,
  ),
  overline: const TextStyle(
    fontWeight: FontWeight.normal, // M: w600
    fontSize: 10.0,
    height: 1.6,
  ),
);
