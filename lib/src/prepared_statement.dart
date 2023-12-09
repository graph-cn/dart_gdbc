// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../dart_gdbc.dart";

abstract class PreparedStatement extends Statement {
  @override
  Future<bool> execute({Map<String, dynamic>? params, String gql});

  @override
  Future<ResultSet> executeQuery({Map<String, dynamic>? params, String gql});

  @override
  Future<int> executeUpdate({Map<String, dynamic>? params, String gql});
}
