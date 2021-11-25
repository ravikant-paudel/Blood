// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'package:flutter/material.dart';
//import 'package:animations/animations.dart';

class DialogUtil {
  DialogUtil(this.navigatorKey);

  final GlobalKey<NavigatorState> navigatorKey;

  bool _isDialogOpen = false;

  /// Returns true if any dialog is open.
  bool get isDialogOpen => _isDialogOpen;

  /// Opens up dialog with [child].
  /// If [barrierDismissible] is true, tapping outside of dialog will pop it
  /// If [backButtonPop] is true, tapping on system back button will pop it
  ///
  /// If a dialog is already open, replaces the older one.
  ///
  /// Defaults: [barrierDismissible] is false and [backButtonPop] is true.
  /* Future<T> show<T>({
    @required Widget child,
    bool barrierDismissible = false,
    bool backButtonPop = true,
  }) {
    assert(child != null, 'show() requires child.');
    if (_isDialogOpen) hide();
    _isDialogOpen = true;
    return showModal<T>(
      context: navigatorKey.currentState.overlay.context,
      configuration: FadeScaleTransitionConfiguration(
        barrierDismissible: barrierDismissible,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            if (backButtonPop) hide();
            return false;
          },
          child: child,
        );
      },
    );
  }*/

  /// Hides open dialog, if any present.
  ///
  /// Optionally, a [value] can be passed, which is returned through [show].
  // void hide<T>([T value]) {
  //   if (_isDialogOpen) {
  //     Navigator.pop(navigatorKey.currentState.overlay.context, value);
  //     _isDialogOpen = false;
  //   }
  // }
}
