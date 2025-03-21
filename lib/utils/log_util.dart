// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'dart:io';

import 'package:logger/logger.dart';

/// Logs provided message
/// Default level is [Level.verbose]
class LogUtil {
  late Logger _logger;
  late Logger _loggerNoStack;

  LogUtil(Level level) {
    Logger.level = level;
    _logger = Logger(printer: PrettyPrinter(colors: false, lineLength: _getConsoleColumns()));
    _loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0, colors: false, lineLength: _getConsoleColumns()));
  }

  /// Verbose Logger
  void v(dynamic message, {dynamic detail, StackTrace? stackTrace}) => _logger.v(message, error: detail, stackTrace: stackTrace);

  /// Debug Logger
  void d(dynamic message, {dynamic detail, StackTrace? stackTrace}) => _loggerNoStack.d(message, error: detail, stackTrace: stackTrace);

  /// Info Logger
  void i(dynamic message, {dynamic detail, StackTrace? stackTrace}) => _loggerNoStack.i(message, error: detail, stackTrace: stackTrace);

  /// Warning Logger
  void w(dynamic message, {dynamic detail, StackTrace? stackTrace}) => _loggerNoStack.w(message, error: detail, stackTrace: stackTrace);

  /// Error Logger
  void e(dynamic message, {dynamic detail, StackTrace? stackTrace}) => _loggerNoStack.e(message, error: detail, stackTrace: stackTrace);

  // static PrettyDioLogger get dioLogger => PrettyDioLogger(
  //       // verbose
  //       requestHeader: Logger.level.index == Level.verbose.index,
  //       responseHeader: Logger.level.index == Level.verbose.index,
  //       // debug, verbose
  //       responseBody: Logger.level.index <= Level.debug.index,
  //       request: Logger.level.index <= Level.debug.index,
  //       requestBody: Logger.level.index <= Level.debug.index,
  //       // error, warning, info, debug, verbose
  //       error: Logger.level.index <= Level.error.index,
  //     );

  int _getConsoleColumns() {
    try {
      return stdout.terminalColumns;
    } on StdoutException {
      return 160;
    }
  }
}
