// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'dart:io';

import 'package:blood/utils/error_log.dart';
import 'package:flutter/services.dart';
import 'package:blood/utils/empty_util.dart';
import 'package:url_launcher/url_launcher.dart' as u;

class UrlLauncherUtil {
  /// Launches Android or iOS app referring to the provided url
  ///
  /// On Android: If app is not installed, play store page for the app is opened.
  Future<bool> launchApp({String? playStoreUrl, String? appStoreUrl}) async {
    try {
      if (Platform.isAndroid && playStoreUrl.isNotNullAndNotEmpty) {
        final packageName = Uri.parse(playStoreUrl!).queryParameters['id'];
        return await u.launch('android-app://$packageName');
      }
      if (Platform.isIOS && appStoreUrl.isNotNullAndNotEmpty) {
        if (await u.canLaunch(appStoreUrl!)) {
          return await u.launch(appStoreUrl);
        }
      }
    } on PlatformException catch (e, s) {
      errorLog(e.message, detail: e.details, stackTrace: s);
      return false;
    }
    return false;
  }

  /// Launches playstore/appstore for reviewing the app.
  Future<bool> launchStoreForReview({required String playStoreId, required String appStoreId}) async {
    try {
      if (Platform.isAndroid) {
        await u.launch('market://details?id=$playStoreId');
      } else if (Platform.isIOS) {
        await u.launch('https://apps.apple.com/app/id$appStoreId?action=write-review');
      }
    } on PlatformException catch (e, s) {
      if (Platform.isAndroid) return _openPlayStore(playStoreId);
      errorLog(e.message, detail: e.details, stackTrace: s);
    }
    return false;
  }

  Future<bool> _openPlayStore(String id) async {
    try {
      return await u.launch('https://play.google.com/store/apps/details?id=$id');
    } on PlatformException catch (e, s) {
      errorLog(e.message, detail: e.details, stackTrace: s);
      return false;
    }
  }

  /// Launches the location with given [latitude] & [longitude] in Google Maps if available,
  /// Otherwise launches map in web browser.
  ///
  /// The URL is extracted from https://developers.google.com/maps/documentation/urls/get-started#search-action
  Future<bool> launchMap(double latitude, double longitude) async {
    final googleMapsParams = {'query': '$latitude,$longitude', 'api': '1'};
    final mapsUrl = Uri.https('www.google.com', '/maps/search/', googleMapsParams).toString();

    try {
      if (mapsUrl.isNotNullAndNotEmpty) return await u.launch(mapsUrl);
    } on PlatformException catch (e, s) {
      errorLog(e.message, detail: e.details, stackTrace: s);
      return false;
    }
    return false;
  }

  /// Launch the sms with the given message
  // Future<bool> launchSms({required String number, String? body, String? title}) async {
  //   try {
  //     if (number.isNotEmpty) {
  //       if (Platform.isAndroid) {
  //         await AndroidPlugin.sendSms(number: number, body: body ?? '', title: title);
  //         return true;
  //       }
  //
  //       final url = 'sms:$number';
  //       final urlSafeBody = Uri.encodeComponent(body ?? '');
  //       return await u.launch('$url&body=$urlSafeBody', forceSafariVC: false);
  //     }
  //   } on PlatformException catch (e, s) {
  //     errorLog(e.message, detail: e.details, stackTrace: s);
  //     return false;
  //   }
  //   return false;
  // }

  /// Launches the email sender with the provided details.
  Future<bool> launchEmail({required String email, required String subject, String? cc, String? bcc, String? body}) async {
    try {
      if (email.isNotEmpty) {
        final uri = Uri(
          scheme: 'mailto',
          path: email,
          queryParameters: {
            'subject': subject,
            if (cc.isNotNull) 'cc': cc,
            if (bcc.isNotNull) 'bcc': bcc,
            if (body.isNotNull) 'body': body,
          },
        );
        return await u.launch(uri.toString().replaceAll('+', '%20'));
      }
    } on PlatformException catch (e, s) {
      errorLog(e.message, detail: e.details, stackTrace: s);
    }
    return false;
  }

  /// Launches the dialer with the provided [phoneNumber].
  Future<bool> launchDialer(String phoneNumber) async {
    try {
      if (phoneNumber.isNotEmpty) {
        final uri = Uri(
          scheme: 'tel',
          path: phoneNumber,
        );
        return await u.launch(uri.toString());
      }
    } on PlatformException catch (e, s) {
      errorLog(e.message, detail: e.details, stackTrace: s);
    }
    return false;
  }

  /// Launches the viberApp with the provided [phoneNumber] chat.
  Future<bool> launchViber(String phoneNumber) async {
    try {
      if (phoneNumber.isNotEmpty) {
        final uri = Uri(
          scheme: 'viber',
          host: 'chat',
          queryParameters: {'number': '+$phoneNumber'},
        );
        return await u.launch(uri.toString());
      }
    } on PlatformException catch (e, s) {
      errorLog(e.message, detail: e.details, stackTrace: s);
    }
    return false;
  }

  /// Launches the WhatsApp with the provided [phoneNumber] chat.
  Future<bool> launchWhatsApp(String phoneNumber) async {
    try {
      if (phoneNumber.isNotEmpty) {
        final uri = Uri(
          scheme: 'whatsapp',
          host: 'send',
          queryParameters: {'phone': phoneNumber},
        );
        return await u.launch(uri.toString());
      }
    } on PlatformException catch (e, s) {
      errorLog(e.message, detail: e.details, stackTrace: s);
    }
    return false;
  }

  /// Launches the Messenger with the provided [messengerId] chat.
  Future<bool> launchMessenger(String messengerUrl) async {
    try {
      if (messengerUrl.isNotEmpty) {
        return await u.launch(messengerUrl);
      }
    } on PlatformException catch (e, s) {
      errorLog(e.message, detail: e.details, stackTrace: s);
    }
    return false;
  }
}
