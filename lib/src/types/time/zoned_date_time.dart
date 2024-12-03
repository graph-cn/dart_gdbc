// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../../dart_gdbc.dart";

class ZonedDateTime extends DateTime {
  final LocalDateTime? dateTime;
  final ZoneOffset? offset;
  final ZoneId? zone;
  ZonedDateTime(this.dateTime, this.offset, this.zone) : super(0);

  Instant toInstant() {
    return Instant.ofEpochSecond(toEpochSecond(), toLocalTime().getNano());
  }

  LocalTime toLocalTime() {
    return LocalTime(hour, minute, second, millisecond, microsecond);
  }

  int toEpochSecond() {
    return (millisecondsSinceEpoch / Duration.millisecondsPerSecond).floor();
  }

  int get nano {
    return microsecond * 1000;
  }

  LocalDateTime toLocalDateTime() {
    return LocalDateTime(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  static ZonedDateTime of(LocalDateTime ldt, ZoneId zone) {
    return ofLocal(ldt, zone);
  }

  static ZonedDateTime ofLocal(LocalDateTime ldt, ZoneId zone,
      [ZoneOffset? offset]) {
    return ZonedDateTime(ldt, offset, zone);
  }

  @override
  String toString() {
    return "${dateTime ?? ''}${offset ?? ''}[${zone ?? ''}]";
  }
}
