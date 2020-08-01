// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'package:auto_route/auto_route.dart';
import 'package:blood/utils/locator.dart';
import 'package:blood/utils/preference_util.dart';

enum Developer {  ravi }

// Shortcuts for frequently needed methods.


///// Shortcut for [DialogUtil].
//DialogUtil get dialog => Locator().dialog;

/// Shortcut for [ExtendedNavigator].
ExtendedNavigatorState get navigator => ExtendedNavigator.named('mainRouter');

/// Shortcut for [PreferenceUtil].
PreferenceUtil get preference => LocatorB().preference;

/// Info Logger
void logThis(dynamic message, {Developer developer}) => LocatorB().logger.i(
      message,
      detail: developer?.toString()?.substring(10)?.toUpperCase(),
    );