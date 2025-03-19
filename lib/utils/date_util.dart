// Copyright (c) 2021. The Khalti Authors. All rights reserved.

import 'package:blood/utils/date_format.dart';
import 'package:blood/utils/empty_util.dart';
import 'package:intl/intl.dart';

class DateUtil {
  final String? rawDateTime;

  DateTime? _dateTime;

  DateUtil(this.rawDateTime) {
    _dateTime = DateTime.tryParse(rawDateTime ?? '')?.toLocal();
  }

  String format(String pattern, {bool useAD = true}) {
    if (_dateTime.isNull) return '';
    // if (useAD) {
    return DateFormat(pattern).format(_dateTime!);
    // } else {
    //   return NepaliDateFormat(pattern, I18n.locale == KhaltiLanguage.english ? Language.english : Language.nepali)
    //       .format(_dateTime!.toNepaliDateTime());
    // }
  }

  // Converts 24 hour time 12 hour
  String hour24To12([String onExceptionTime = '']) {
    if (_dateTime.isNull) return onExceptionTime;
    return DateFormat(DateFormatPattern.time12Hour).format(dateTime!);
  }

  /// Returns [DateTime] for the provided [rawDateTime].
  DateTime? get dateTime => _dateTime;

  Duration? difference({DateTime? anotherDate, String? anotherRawDate, bool reverse = false}) {
    final _anotherDate = _getAnotherDate(anotherDate, anotherRawDate);
    if (_anotherDate.isNull) return null;
    if (reverse) return _anotherDate!.difference(_dateTime!);
    return _dateTime!.difference(_anotherDate!);
  }

  bool isAfter({DateTime? anotherDate, String? anotherRawDate, bool inclusive = false}) {
    final _anotherDate = _getAnotherDate(anotherDate, anotherRawDate);
    if (_anotherDate.isNull) return false;
    if (inclusive) {
      return _dateTime!.isAfter(_anotherDate!) || _dateTime!.isAtSameMomentAs(_anotherDate);
    }
    return _dateTime!.isAfter(_anotherDate!);
  }

  bool isBefore({DateTime? anotherDate, String? anotherRawDate, bool inclusive = false}) {
    final _anotherDate = _getAnotherDate(anotherDate, anotherRawDate);
    if (_anotherDate.isNull) return false;
    if (inclusive) {
      return _dateTime!.isBefore(_anotherDate!) || _dateTime!.isAtSameMomentAs(_anotherDate);
    }
    return _dateTime!.isBefore(_anotherDate!);
  }

  bool isBetween({DateTime? startDate, String? startRawDate, DateTime? endDate, String? endRawDate, bool inclusive = false}) {
    final _startDate = _getAnotherDate(startDate, startRawDate);
    final _endDate = _getAnotherDate(endDate, endRawDate);

    if (_startDate.isNull || _endDate.isNull) return false;

    if (inclusive) {
      return (_dateTime!.isBefore(_endDate!) || _dateTime!.isAtSameMomentAs(_endDate)) &&
          (_dateTime!.isAfter(_startDate!) || _dateTime!.isAtSameMomentAs(_startDate));
    }
    return _dateTime!.isBefore(_endDate!) && _dateTime!.isAfter(_startDate!);
  }

  DateTime? _getAnotherDate(DateTime? anotherDate, String? anotherRawDate) {
    assert(anotherDate.isNotNull || anotherRawDate.isNotNull, 'Either of the options should be passed');
    if (_dateTime.isNull && anotherDate.isNull && anotherRawDate.isNullOrEmpty) return null;
    return anotherDate.isNull ? DateTime.tryParse(anotherRawDate!) : anotherDate;
  }

  static DateTime get lastMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month, 1).subtract(const Duration(days: 1));
  }
}

extension DurationExtension on Duration {
  /// Formats the duration as:
  ///
  /// Duration = 2:25:56.213456
  /// ::
  /// hour = 02
  /// minute = 25
  /// second = 56
  ///
  /// hour, minute and second always has two-characters.
  ///
  FormattedDuration format() {
    final actualTick = toString().split('.').first;
    final formattedTicks = actualTick.split(':').toList();
    return FormattedDuration(
      hour: formattedTicks[0].padLeft(2, '0'),
      minute: formattedTicks[1],
      second: formattedTicks[2],
    );
  }
}

class FormattedDuration {
  final String hour;
  final String minute;
  final String second;

  FormattedDuration({
    this.hour = '00',
    this.minute = '00',
    this.second = '00',
  });
}
