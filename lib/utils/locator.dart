// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'dart:async';

import 'package:blood/utils/log_util.dart';
import 'package:blood/utils/network_util.dart';
import 'package:blood/utils/preference_util.dart';
import 'package:logger/logger.dart';


class LocatorB {
  static LocatorB _instance;
  static final _isInit = Completer<void>();
  static bool _isTest = true;

  /// Lazy singleton to locate all the dependencies.
  factory LocatorB() => _instance ??= LocatorB._();

  LocatorB._() {
    if (_isTest) {
      _isInit.complete();
    } else {
      _init();
    }
  }

  /// Await locator so that it can complete initialization.
  static Future<void> init() {
    _isTest = false;
    LocatorB();
    return _isInit.future;
  }

  // ******************** Instantiate Locator ********************
  Future<void> _init() async {

    // Plugins Here
//    await deviceInfo.init();
//    await packageInfo.init();
    await preference.init();

    // DO NOT ALTER
    _isInit.complete();
  }

  // ********************** Locator Members ***********************
  // Don't forgot to initialize if asynchronous setup is required.
//  KhaltiDatabase khaltiDb = KhaltiDatabase();
  PreferenceUtil preference = PreferenceUtil();
//  DeviceUtil deviceInfo = DeviceUtil();
//  PackageUtil packageInfo = PackageUtil();
  LogUtil logger = LogUtil(Level.verbose);
//  DialogUtil dialog = DialogUtil(rootNavKey);
  NetworkUtil connectivity = NetworkUtil();
}
