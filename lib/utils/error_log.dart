// Copyright (c) 2020 The Khalti Authors. All rights reserved.

import 'package:blood/utils/log_util.dart';
import 'package:logger/logger.dart';


void errorLog(dynamic message, {dynamic detail, StackTrace stackTrace}) =>
    LogUtil(Level.error).e(message, detail: detail, stackTrace: stackTrace);
