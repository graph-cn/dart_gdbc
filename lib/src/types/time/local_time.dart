// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../../dart_gdbc.dart";

class LocalTime extends DateTime {
  LocalTime(super.year,
      [super.month,
      super.day,
      super.hour,
      super.minute,
      super.second,
      super.millisecond,
      super.microsecond]);

  int toNanoOfDay() {
    return (hour * Duration.microsecondsPerHour +
            minute * Duration.microsecondsPerMinute +
            second * Duration.microsecondsPerSecond +
            millisecond * Duration.microsecondsPerMillisecond +
            microsecond) *
        1000;
  }

  int getNano() {
    return toNanoOfDay();
  }

  static LocalTime ofNanoOfDay(int nanoOfDay) {
    return LocalTime.fromMicrosecondsSinceEpoch(nanoOfDay ~/ 1000);
  }

  static LocalTime fromMicrosecondsSinceEpoch(int microsecondsSinceEpoch) {
    var dt = DateTime(0).add(Duration(microseconds: microsecondsSinceEpoch));
    return LocalTime(dt.year, dt.month, dt.day, dt.hour, dt.minute, dt.second,
        dt.millisecond, dt.microsecond);
  }
}
