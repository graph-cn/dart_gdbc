// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../dart_gdbc.dart";

/// A super class for all exceptions thrown by dart_gdbc.
class GdbcException implements Error {
  final String? code;

  final String? message;

  final Error? cause;

  GdbcException({this.code, this.message, this.cause});

  @override
  StackTrace? get stackTrace => cause?.stackTrace;

  @override
  String toString() {
    var buffer = StringBuffer();
    buffer.write(runtimeType);
    if (message != null) {
      buffer.write(': $message');
    }
    if (cause != null) {
      buffer.write('\nCause: $cause');
    }
    return buffer.toString();
  }
}
