// Copyright (c) 2020 The Blood Authors. All rights reserved.

//import 'package:blood/resources/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

part 'colors.dart';
part 'typography.dart';

/*class ThemeNotifier extends StateNotifier<ThemeData> {
  final bool isDark;

  ThemeNotifier(this.isDark) : super(isDark ? _darkTheme : _lightTheme);

  setLightTheme() => state = _lightTheme;
  setDarkTheme() => state = _darkTheme;

  static final _darkTheme = ThemeData(
    primarySwatch: Colors.amber,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    indicatorColor: Colors.amber,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.amber,
    accentIconTheme: IconThemeData(color: Colors.amberAccent),
    dividerColor: Colors.white54,
  );

  static final _lightTheme = ThemeData(
    primarySwatch: Colors.teal,
    primaryColor: Colors.teal[800],
    indicatorColor: Colors.teal,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.teal,
    accentIconTheme: IconThemeData(color: Colors.tealAccent),
    dividerColor: Colors.grey,
  );
}*/


class BloodTheme {
  final ThemeMode themeMode;

  const BloodTheme(this.themeMode);

  bool get isDarkMode =>
      themeMode == ThemeMode.dark ||
      (themeMode == ThemeMode.system && SchedulerBinding.instance.window.platformBrightness == Brightness.dark);

  ThemeData get themeData => isDarkMode ? darkTheme : lightTheme;

  PageTransitionsTheme get pageTransitionTheme => const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  // TODO: Use dark variant when available
  BloodThemeColor get color => BloodThemeColor(
        primary: isDarkMode ? _primaryColorDark : _primaryColorLight,
        secondary: _secondaryColor,
        accent: isDarkMode ? _accentColorDark : _accentColorLight,
        surface: isDarkMode ? _surfaceColorDark : _surfaceColorDark,
        complementary: _complementaryColor,
        error: _errorColor,
      );

  ThemeData get lightTheme => ThemeData.from(
        colorScheme: _colorScheme(),
        textTheme: _bloodTextTheme,
      ).copyWith(
        accentColor: _primaryColorLight,
        primaryColorDark: _primaryColorLight,
        inputDecorationTheme: _inputDecorationTheme,
        indicatorColor: _primaryColorLight,
        tabBarTheme: _tabBarTheme,
        cursorColor: _primaryColorLight,
        textSelectionHandleColor: _primaryColorLight,
        snackBarTheme: SnackBarThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: _primaryColorLight.shade900,
          behavior: SnackBarBehavior.floating,
          contentTextStyle: _bloodTextTheme.bodyText2.copyWith(color: Colors.white, height: 1),
        ),
        pageTransitionsTheme: pageTransitionTheme,
      );

  ThemeData get darkTheme => ThemeData.from(
        colorScheme: _colorScheme(isDark: true),
        textTheme: _bloodTextTheme,
      ).copyWith(
        accentColor: _primaryColorDark,
        primaryColorDark: _primaryColorDark,
        inputDecorationTheme: _inputDecorationTheme,
        indicatorColor: _primaryColorDark,
        tabBarTheme: _tabBarTheme,
        cursorColor: _primaryColorDark,
        textSelectionHandleColor: _primaryColorDark,
        snackBarTheme: SnackBarThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: _primaryColorDark.shade900,
          behavior: SnackBarBehavior.floating,
          contentTextStyle: _bloodTextTheme.bodyText2.copyWith(color: Colors.white, height: 1),
        ),
        pageTransitionsTheme: pageTransitionTheme,
      );

  ColorScheme _colorScheme({bool isDark = false}) {
    return isDark
        ? ColorScheme.dark(
            primary: _primaryColorDark,
            background: Colors.black,
            onBackground: _primaryColorDark.shade10,
            primaryVariant: _primaryColorDark.shade700,
            onPrimary: _primaryColorDark.shade50,
            secondary: _primaryColorDark.shade200,
            secondaryVariant: _accentColorDark.shade200,
            error: _errorColor,
          )
        : ColorScheme.light(
            primary: _primaryColorLight,
            secondary: _accentColorLight,
            secondaryVariant: _accentColorLight.shade200,
            error: _errorColor,
          );
  }

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        labelStyle: _bloodTextTheme.bodyText2.copyWith(color: color.surface.shade100),
        hintStyle: _bloodTextTheme.caption.copyWith(color: color.surface.shade100),
        helperStyle: _bloodTextTheme.caption.copyWith(color: color.surface.shade50, fontSize: 10, height: 0.6),
        prefixStyle: _bloodTextTheme.bodyText2.copyWith(color: color.surface.shade50),
        errorStyle: _bloodTextTheme.overline.copyWith(color: color.error),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color.surface.shade200),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color.primary),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color.error, width: 2.0),
        ),
        contentPadding: EdgeInsets.zero,
      );

  TabBarTheme get _tabBarTheme =>
      TabBarTheme(unselectedLabelColor: _surfaceColorLight.shade50, labelStyle: _bloodTextTheme.subtitle2, labelColor: color.primary);
}

class BloodThemeColor {
  final BloodColor primary;
  final BloodColor accent;
  final BloodColor surface;
  final Color secondary;
  final Color complementary;
  final Color error;

  const BloodThemeColor({
    this.primary,
    this.accent,
    this.surface,
    this.secondary,
    this.complementary,
    this.error,
  });
}
