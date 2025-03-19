// Copyright (c) 2020 The Blood Authors. All rights reserved.

import 'dart:async';

import 'package:blood/utils/error_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'empty_util.dart';

enum PreferenceKey {
  userId,
  themeMode,
  notificationToken,
  verificationId,
}

class PreferenceUtil {
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> set<T>(PreferenceKey prefKey, T value) async {
    try {
      final key = prefKey.name;
      if (value is String) return _prefs.setString(key, value);
      if (value is int) return _prefs.setInt(key, value);
      if (value is bool) return _prefs.setBool(key, value);
      if (value is double) return _prefs.setDouble(key, value);
      if (value is List<String>) return _prefs.setStringList(key, value);
      return false;
    } on Exception catch (e, s) {
      errorLog(e, stackTrace: s);
      return false;
    }
  }

  bool has(PreferenceKey prefKey) => prefKey.name.isNotNullAndNotEmpty && _prefs.containsKey(prefKey.name);

  T get<T>(PreferenceKey prefKey) {
    try {
      return _prefs.get(prefKey.name) as T;
    } on Exception catch (e, s) {
      errorLog(e, stackTrace: s);
      rethrow;
    }
  }

  Future<bool> clearAll() async {
    try {
      return await _prefs.clear();
    } on Exception catch (e, s) {
      errorLog(e, stackTrace: s);
      return false;
    }
  }

  Future<bool> remove(PreferenceKey prefKey) async => prefKey.name.isNotNullAndNotEmpty && await _prefs.remove(prefKey.name);
}
