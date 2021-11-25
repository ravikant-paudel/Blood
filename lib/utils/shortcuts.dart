// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'package:auto_route/auto_route.dart';
import 'package:blood/helper/router/router.gr.dart';
import 'package:blood/utils/locator.dart';
import 'package:blood/utils/preference_util.dart';
import 'package:blood/widgets/firebase_wrapper.dart';

enum Developer { ravi }

// Shortcuts for frequently needed methods.

///// Shortcut for [DialogUtil].
//DialogUtil get dialog => Locator().dialog;

/// Shortcut for [FirebaseWrapper].
FirebaseWrapper get fbWrapper => LocatorB().fbWrapper;

/// Shortcut for [ExtendedNavigator].
final Router router = Router();

/// Shortcut for [PreferenceUtil].
PreferenceUtil get preference => LocatorB().preference;

/// Info Logger
void logThis(dynamic message, {Developer? developer}) => LocatorB().logger.i(
      message,
      detail: developer?.toString().substring(10).toUpperCase(),
    );
