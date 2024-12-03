// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of '../../../dart_gdbc.dart';

class ZoneRegion extends ZoneId {
  final String id;
  ZoneRegion(this.id) : super(0);

  factory ZoneRegion.ofId(String id, [bool checkAvailable = true]) {
    ArgumentError.checkNotNull(id, 'id');
    // if (checkAvailable) {
    //   if (!ZoneRules.availableRegions.contains(id)) {
    //     throw ArgumentError('Unknown time-zone ID: $id');
    //   }
    // }
    return ZoneRegion(id);
  }
}
