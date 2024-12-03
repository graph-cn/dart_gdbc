// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of '../../../dart_gdbc.dart';

class Instant extends Duration {
  final int seconds;
  final int nanos;

  static final Instant EPOCH = Instant._(0, 0);

  static final int MIN_SECOND = -31557014167219200;

  static final int MAX_SECOND = 31556889864403199;

  Instant._(this.seconds, this.nanos) : super();

  static Instant create(int seconds, int nanos) {
    if ((seconds | nanos) == 0) {
      return Instant.EPOCH;
    }
    if (seconds < MIN_SECOND || seconds > MAX_SECOND) {
      throw ArgumentError('seconds out of range');
    }
    return Instant._(seconds, nanos);
  }

  static Instant ofEpochSecond(int epochSecond, [int nanoOfSecond = 0]) {
    return Instant.create(epochSecond, nanoOfSecond);
  }

  int get secondsSinceEpoch => seconds;
}
