// Copyright (c) 2020 The Blood Authors. All rights reserved.

//import 'package:blood/resources/colors.dart';

import 'package:blood/utils/preference_util.dart';
import 'package:blood/utils/resources/colors.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<BloodTheme> themeProvider = StateNotifierProvider((_) => BloodTheme());

class BloodTheme extends StateNotifier<ThemeData> {
  BloodTheme() : super(_lightTheme);

  void onThemeChange(bool isDark) {
    state = isDark ? _darkTheme : _lightTheme;
    preference.set(PreferenceKey.THEME_MODE, isDark);
  }

  void init() {
    onThemeChange(preference.get(PreferenceKey.THEME_MODE) ?? false);
  }

  static final _darkTheme = ThemeData.from(
    colorScheme: const ColorScheme.dark(
      primary: primaryColorDark,
//      background: Colors.black,
      secondary: Colors.black,
      onSecondary: Colors.white,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  static final _lightTheme = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: primaryColorLight,
      secondary: Colors.white,
      onSecondary: Colors.white,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
  ).copyWith(
    scaffoldBackgroundColor: const Color(0xFFE4E4E4),
    indicatorColor: Colors.black,
  );
}
