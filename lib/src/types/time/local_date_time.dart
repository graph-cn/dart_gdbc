// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../../dart_gdbc.dart";

class LocalDateTime extends DateTime {
  LocalDateTime(super.year,
      [super.month,
      super.day,
      super.hour,
      super.minute,
      super.second,
      super.millisecond,
      super.microsecond]);

  int getNano() {
    return microsecond * 1000;
  }

  int toEpochSecond(ZoneOffset offset) {
    return (millisecondsSinceEpoch / Duration.millisecondsPerSecond).floor() -
        offset.getTotalSeconds();
  }

  int get nano {
    return getNano();
  }

  static LocalDateTime ofEpochSecond(
      int seconds, int nanoOfSecond, ZoneOffset offset) {
    return LocalDateTime.fromMillisecondsSinceEpoch(
        (seconds + offset.getTotalSeconds()) * Duration.millisecondsPerSecond +
            nanoOfSecond ~/ 1000);
  }

  static LocalDateTime ofInstant(Instant instant, ZoneId offset) {
    return LocalDateTime.fromMillisecondsSinceEpoch(
        instant.secondsSinceEpoch * Duration.millisecondsPerSecond +
            instant.nanos ~/ 1000);
  }

  static LocalDateTime fromMillisecondsSinceEpoch(int millisecondsSinceEpoch) {
    var dt = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    return LocalDateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute,
        dt.second, dt.millisecond, dt.microsecond);
  }
}
