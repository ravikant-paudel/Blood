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

import 'package:blood/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme bloodTextThemeLight = TextTheme(
  headlineSmall: GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 24.0,
    height: 1.416,
    color: primaryTextLight,
  ),
  titleLarge: GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
    height: 1.5,
    color: primaryTextLight,
  ),
  bodyLarge: GoogleFonts.poppins(
    fontWeight: FontWeight.w500, // M-I: w600 , B-I: bold
    fontSize: 16.0,
    height: 1.571,
    color: secondaryTextLight,
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: 14.0,
    height: 1.571,
    color: secondaryTextLight,
  ),
);

TextTheme bloodTextThemeDark = TextTheme(
  headlineSmall: GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 24.0,
    height: 1.416,
    color: primaryTextDark,
  ),
  titleLarge: GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
    height: 1.5,
    color: primaryTextDark,
  ),
  bodyLarge: GoogleFonts.poppins(
    fontWeight: FontWeight.w500, // M-I: w600 , B-I: bold
    fontSize: 16.0,
    height: 1.571,
    color: secondaryTextDark,
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: 14.0,
    height: 1.571,
    color: secondaryTextDark,
  ),
);
