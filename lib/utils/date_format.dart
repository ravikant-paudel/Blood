// Copyright (c) 2021. The Khalti Authors. All rights reserved.

class DateFormatPattern {
  /// 29 Apr, 2021
  static const String dayMonthNameYear = 'd MMM, y';

  /// 29 Apr, 2021, Thursday
  static const String dayMonthNameYearDayName = 'd MMM, y, EEEE';

  /// 29 April 2021, Thursday
  static const String dayFullMonthNameYearDayName = 'd MMMM y, EEEE';

  /// 29 Sat Apr 2021 11:00 AM
  static const String dayMonthYearTime = 'd EEE MMM y hh:mm a';

  /// 29 Apr 2021, 11:00 AM
  static const String dayMonthNameYearTime = 'd MMM y, hh:mm a';

  /// Thursday
  static const String dayName = 'EEEE';

  /// Thursday, 29 April 2021
  static const String fullDateWithDay = 'EEEE, d MMMM y';

  /// 29 Apr 2021
  static const String fullDateWithShortMonth = 'd MMM y';

  /// 29 April 2021
  static const String fullDateWithFullMonth = 'd MMMM y';

  /// Thursday, 29 April 2021 at 09:29 PM
  static const String fullDateWithTimeAndDay = "EEEE, d MMMM y 'at' hh:mm a";

  /// Thursday, 29 Apr 2021 at 09:29 PM
  static const String fullDateWithShortMonthAndTimeAndDay = "EEEE, d MMM y 'at' hh:mm a";

  /// Thursday, 29 April 2021, 09:29 PM
  static const String fullDateWithTimeAndDayAlt = 'EEEE, d MMMM y, hh:mm a';

  /// Apr 2021
  static const String monthNameYear = 'MMM y';

  /// 29 Apr
  static const String shortMonthWithDay = 'd MMM';

  /// 09:29 PM
  static const String time12Hour = 'hh:mm a';

  /// Thursday
  static const String weekdayName = 'EEEE';

  /// 2021-4-9
  static const String yearMonthDay = 'y-M-d';

  /// 2021-04-29
  static const String yyyyMMDD = 'y-MM-dd';

  /// 2021-05
  static const String yyyyMM = 'y-MM';
}
