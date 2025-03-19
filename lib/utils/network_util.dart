// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtil {
  /// Returns true if device is not connected to any network.
  Future<bool> isNetworkAvailable() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  /// Returns true if device has working internet access.
  Future<bool> hasConnection() async {
    if (await isNetworkAvailable()) {
      try {
        final addresses = await InternetAddress.lookup('google.com').timeout(const Duration(seconds: 1));
        return addresses.isNotEmpty && addresses[0].rawAddress.isNotEmpty;
      } on SocketException {
        return false;
      } on TimeoutException {
        try {
          final addresses = await InternetAddress.lookup('catchsquare.com').timeout(const Duration(seconds: 5));
          return addresses.isNotEmpty && addresses[0].rawAddress.isNotEmpty;
        } on SocketException {
          return false;
        } on TimeoutException {
          return false;
        }
      }
    }
    return false;
  }
}
