// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../dart_gdbc.dart";

/// Represents a GQL statement.
abstract class Statement {
  /// Executes the given GQL statement, which may return multiple results.
  Future<bool> execute({required String gql});

  /// Executes the given GQL statement, which returns a single ResultSet object.
  Future<ResultSet> executeQuery({required String gql});

  /// Executes the given GQL statement, which may be an INSERT, UPDATE, or DELETE statement or an SQL statement that returns nothing, such as an GQL DDL statement.
  Future<int> executeUpdate({required String gql});
}
