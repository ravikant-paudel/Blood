// Copyright (c) 2020 The Blood Authors. All rights reserved.

//import 'package:blood/resources/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_notifier/state_notifier.dart';

part 'colors.dart';

part 'typography.dart';

final  themeProvider = StateNotifierProvider((_) => BloodTheme(true));

class BloodTheme extends StateNotifier<ThemeData> {
  final bool isDark;

  BloodTheme(this.isDark) : super(isDark ? _darkTheme : _lightTheme);

  ThemeData setLightTheme() => state = _lightTheme;

  ThemeData setDarkTheme() => state = _darkTheme;

  static final _darkTheme = ThemeData.from(
      colorScheme: const ColorScheme.dark(
    primary: primaryColorDark,
    background: Colors.black,
//    onBackground: _primaryColorDark.shade10,
//    primaryVariant: _primaryColorDark.shade700,
//    onPrimary: _primaryColorDark.shade50,
//    secondary: _primaryColorDark.shade200,
//    secondaryVariant: _accentColorDark.shade200,
//    error: _errorColor,
  ));

  static final _lightTheme = ThemeData.from(
      colorScheme: const ColorScheme.light(
    primary: primaryColorDark,
    /*primarySwatch: Colors.teal,
    primaryColor: Colors.teal[800],
    indicatorColor: Colors.teal,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.teal,
    accentIconTheme: IconThemeData(color: Colors.tealAccent),
    dividerColor: Colors.grey,*/
  ));
}
