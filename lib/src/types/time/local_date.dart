// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../../dart_gdbc.dart";

class LocalDate extends DateTime {
  LocalDate(super.year,
      [super.month,
      super.day,
      super.hour,
      super.minute,
      super.second,
      super.millisecond,
      super.microsecond]);

  int toEpochDay() {
    return (millisecondsSinceEpoch / Duration.millisecondsPerDay).floor();
  }

  static LocalDate ofEpochDay(int epochDay) {
    return LocalDate.fromMillisecondsSinceEpoch(
        epochDay * Duration.millisecondsPerDay);
  }

  static LocalDate fromMillisecondsSinceEpoch(int millisecondsSinceEpoch) {
    var dt = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    return LocalDate(dt.year, dt.month, dt.day);
  }
}
