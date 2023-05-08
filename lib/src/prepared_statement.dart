// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of dart_gdbc;

abstract class PreparedStatement extends Statement {
  @override
  Future<bool> execute([String gql, Map<String, dynamic>? params]);

  @override
  Future<ResultSet> executeQuery([String gql, Map<String, dynamic>? params]);

  @override
  Future<int> executeUpdate(String gql, [Map<String, dynamic>? params]);
}
