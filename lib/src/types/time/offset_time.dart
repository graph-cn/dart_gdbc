// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../../dart_gdbc.dart";

class OffsetTime extends DateTime {
  OffsetTime([
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  ]) : super(0, 0, 0, hour, minute, second, millisecond, microsecond);

  LocalTime toLocalTime() {
    return LocalTime(hour, minute, second, millisecond, microsecond);
  }

  ZoneOffset getOffset() {
    return ZoneOffset(second);
  }

  static OffsetTime of(LocalTime lt, ZoneOffset offset) {
    var dt = OffsetTime(
            lt.hour, lt.minute, lt.second, lt.millisecond, lt.microsecond)
        .add(Duration(seconds: offset.totalSeconds));
    return OffsetTime(
        dt.hour, dt.minute, dt.second, dt.millisecond, dt.microsecond);
  }
}
