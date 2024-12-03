// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../dart_gdbc.dart";

/// Exception thrown when a connection to a database could not be established.
///---
/// 當無法連接到數據庫時拋出的異常。
///---
/// 当无法连接到数据库时抛出的异常。
class ConnectException extends GdbcException {
  ConnectException({super.code, super.message, super.cause});
}
