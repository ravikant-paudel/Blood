// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'package:blood/helper/router/router.gr.dart';
import 'package:blood/providers/auth_provider.dart';
import 'package:blood/utils/locator.dart';
import 'package:blood/utils/preference_util.dart';
import 'package:blood/widgets/firebase_wrapper.dart';
import 'package:blood/utils/empty_util.dart';

enum Developer { ravi }

// Shortcuts for frequently needed methods.

///// Shortcut for [DialogUtil].
//DialogUtil get dialog => Locator().dialog;

/// Shortcut for [FirebaseWrapper].
FirebaseWrapper get fbWrapper => LocatorB().fbWrapper;

/// Shortcut for [ExtendedNavigator].
final RootRouter router = RootRouter();

/// Shortcut for [PreferenceUtil].
PreferenceUtil get preference => LocatorB().preference;

/// Info Logger
void logThis(dynamic message, {String? tag, Developer? developer}) {
  _log(message, tag: tag, developer: developer);
}

void _log(dynamic message, {String? tag, Developer? developer}) {
  final dev = '[${developer?.toString().substring(10).toUpperCase()}]';
  final hasDetail = tag.isNotNullAndNotEmpty || developer.isNotNullAndNotEmpty;

  LocatorB().logger.i(message, detail: hasDetail ? '${tag ?? ''} ${developer.isNotNullAndNotEmpty ? dev : ''}' : null);
}
