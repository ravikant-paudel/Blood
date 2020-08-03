// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'dart:async';

import 'package:blood/utils/error_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'empty_util.dart';

enum PreferenceKey {
  USER_ID,
  THEME_MODE,
}

extension RawPrefenceKey on PreferenceKey {
  String get rawKey => toString().substring(14);
}

class PreferenceUtil {
  SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> set<T>(PreferenceKey prefKey, T value) {
    final key = prefKey.rawKey;
    if (key.isNotNullAndNotEmpty) {
      if (value is String) return _prefs.setString(key, value);
      if (value is int) return _prefs.setInt(key, value);
      if (value is bool) return _prefs.setBool(key, value);
      if (value is double) return _prefs.setDouble(key, value);
      if (value is List<String>) return _prefs.setStringList(key, value);
    }
    return Future.value(false);
  }

  bool has(PreferenceKey prefKey) => prefKey.rawKey.isNotNullAndNotEmpty && _prefs.containsKey(prefKey.rawKey);

  T get<T>(PreferenceKey prefKey) {
    try {
      return _prefs.get(prefKey.rawKey) as T;
    } on Exception catch (e, s) {
      errorLog(e, stackTrace: s);
      rethrow;
    }
  }

  Future<bool> remove(PreferenceKey prefKey) async => prefKey.rawKey.isNotNullAndNotEmpty && await _prefs.remove(prefKey.rawKey);
}
