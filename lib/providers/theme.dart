// Copyright (c) 2020 The Blood Authors. All rights reserved.

//import 'package:blood/resources/colors.dart';

import 'package:blood/utils/preference_util.dart';
import 'package:blood/utils/resources/colors.dart';
import 'package:blood/utils/resources/typography.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<BloodTheme> themeProvider = StateNotifierProvider((_) => BloodTheme());

//final FutureProvider<SharedPreferences> preferenceProvider = FutureProvider((ref) => SharedPreferences.getInstance());

class BloodTheme extends StateNotifier<ThemeData> {
  BloodTheme() : super(_lightTheme);

  void onThemeChange(bool isDark) {
    state = isDark ? _darkTheme : _lightTheme;
    preference.set(PreferenceKey.THEME_MODE, isDark);
  }

  void init() {
    onThemeChange(preference.get(PreferenceKey.THEME_MODE));
  }

  static final _darkTheme = ThemeData.from(
    colorScheme: ColorScheme.dark(
      primary: primaryColorDark,
      background: Colors.black,
      secondary: Colors.black,
      onSecondary: Colors.white,
//    onBackground: _primaryColorDark.shade10,
//    primaryVariant: _primaryColorDark.shade700,
//    onPrimary: _primaryColorDark.shade50,
//    secondary: _primaryColorDark.shade200,
//    secondaryVariant: _accentColorDark.shade200,
//    error: _errorColor,
    ),
    textTheme: bloodTextTheme,
  );

  static final _lightTheme = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: primaryColorDark,
      secondary: Colors.white,
      /*primarySwatch: Colors.teal,
    primaryColor: Colors.teal[800],
    indicatorColor: Colors.teal,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.teal,
    accentIconTheme: IconThemeData(color: Colors.tealAccent),
    dividerColor: Colors.grey,*/
    ),
    textTheme: bloodTextTheme,
  );
}
