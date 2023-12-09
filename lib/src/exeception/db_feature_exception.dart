// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../dart_gdbc.dart";

/// A [GdbcException] thrown when a feature is not supported by the database.
class DbFeatureException extends GdbcException {
  /// Creates a [DbFeatureException] with the given [message] and [cause].
  DbFeatureException(String message, {super.cause}) : super(message: message);
}
