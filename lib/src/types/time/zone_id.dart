// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of '../../../dart_gdbc.dart';

abstract class ZoneId extends DateTime {
  ZoneId(super.year,
      [super.month,
      super.day,
      super.hour,
      super.minute,
      super.second,
      super.millisecond,
      super.microsecond]);

  String get id;

  factory ZoneId.ofString(String zoneId) {
    ArgumentError.checkNotNull(zoneId, 'zoneId');

    if (zoneId.length <= 1 ||
        zoneId.startsWith('+') ||
        zoneId.startsWith('-')) {
      return ZoneOffset.ofId(zoneId);
    } else if (zoneId.startsWith('UTC') || zoneId.startsWith('GMT')) {
      return ZoneId.ofWithPrefix(zoneId, 3);
    } else if (zoneId.startsWith('UT')) {
      return ZoneId.ofWithPrefix(zoneId, 2);
    }

    return ZoneRegion.ofId(zoneId, true);
  }

  factory ZoneId.ofWithPrefix(String zoneId, int prefixLength,
      [bool checkAvailable = true]) {
    String prefix = zoneId.substring(0, prefixLength);
    if (zoneId.length == prefixLength) {
      return ZoneOffset.ofId(prefix);
    } else if (zoneId[prefixLength] == '+') {
      return ZoneOffset.ofId(zoneId);
    } else if (zoneId[prefixLength] == '-') {
      return ZoneOffset.ofId(zoneId);
    } else {
      return ZoneRegion.ofId(zoneId, checkAvailable);
    }
  }
}
