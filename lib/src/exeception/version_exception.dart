// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of dart_gdbc;

class VersionException extends GdbcException {
  VersionException({String? message, Error? cause})
      : super(message: message, cause: cause);
}
