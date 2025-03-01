// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../dart_gdbc.dart";

/// Thrown when client and server versions are incompatible.
class VersionException extends GdbcException {
  VersionException({super.code, super.message, super.cause});
}
