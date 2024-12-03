// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../../dart_gdbc.dart";

class ZoneOffset extends ZoneId {
  late final String id;
  final int totalSeconds;

  factory ZoneOffset.ofId(String id) {
    ArgumentError.checkNotNull(id, 'id');
    if (id == "Z") {
      return ZoneOffset(0);
    }
    if (id.length < 2) {
      throw ArgumentError('Invalid ID for ZoneOffset: $id');
    }
    var negative = id.startsWith("-");
    var hours = int.parse(id.substring(1, 3));
    var minutes = id.length >= 5 ? int.parse(id.substring(4, 6)) : 0;
    var seconds = id.length >= 8 ? int.parse(id.substring(7, 9)) : 0;
    var totalSeconds = (hours * Duration.secondsPerHour +
            minutes * Duration.secondsPerMinute +
            seconds) *
        (negative ? -1 : 1);
    return ZoneOffset(totalSeconds);
  }

  ZoneOffset(this.totalSeconds) : super(0, 0, 0, 0, 0, totalSeconds, 0, 0) {
    id = buildId(totalSeconds);
  }

  static final ZoneOffset UTC = ZoneOffset.ofTotalSeconds(0);
  int getTotalSeconds() {
    return (hour * Duration.secondsPerHour +
            minute * Duration.secondsPerMinute +
            second) *
        1000;
  }

  int inSeconds() {
    return getTotalSeconds();
  }

  static ZoneOffset ofTotalSeconds(int totalSeconds) {
    return ZoneOffset(totalSeconds);
  }

  static String buildId(int totalSeconds) {
    if (totalSeconds == 0) {
      return "Z";
    } else {
      int absTotalSeconds = totalSeconds.abs();
      StringBuffer buf = StringBuffer();
      int absHours = absTotalSeconds ~/ Duration.secondsPerHour;
      int absMinutes = (absTotalSeconds ~/ Duration.secondsPerMinute) %
          Duration.minutesPerHour;

      buf.write(totalSeconds < 0 ? "-" : "+");
      buf.write(absHours < 10 ? "0" : "");
      buf.write(absHours);
      buf.write(absMinutes < 10 ? ":0" : ":");
      buf.write(absMinutes);

      int absSeconds = absTotalSeconds % Duration.secondsPerMinute;
      if (absSeconds != 0) {
        buf.write(absSeconds < 10 ? ":0" : ":");
        buf.write(absSeconds);
      }

      return buf.toString();
    }
  }
}
