// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../dart_gdbc.dart";

/// A connection (session) with a specific database.
abstract class Connection {
  Connection({this.onClose, this.version});

  /// zh: 图数据库中的表空间
  ///
  /// zh_hant: 圖資料庫中的表空間
  ///
  /// en: The table space in the graph database
  String? get databaseName;

  /// zh: 连接关闭时的回调函数
  ///
  /// zh_hant: 連接關閉時的回調函數
  ///
  /// en: Callback function when the connection is closed
  Function()? onClose;

  /// zh: 数据库版本
  ///
  /// zh_hant: 數據庫版本
  ///
  /// en: Database version
  String? version;

  /// Creates a new [Statement] instance.
  Future<Statement> createStatement();

  /// Creates a new [PreparedStatement] instance.
  Future<PreparedStatement> prepareStatement(
    String gql, {
    String Function(String, Map<String, dynamic>?)? render,
  });

  /// Creates a new [PreparedStatement] instance with parameters.
  Future<PreparedStatement> prepareStatementWithParameters(
      String gql, List<ParameterMetaData> parameters);

  /// Executes a query.
  Future<ResultSet> executeQuery(String gql, {Map<String, dynamic>? params});

  /// Executes an update.
  Future<int> executeUpdate(String gql);

  /// Connection state if auto commit is enabled.
  Future<bool> getAutoCommit();

  /// Set connection state if auto commit is enabled.
  Future<void> setAutoCommit(bool autoCommit);

  /// Commits all changes made since the previous commit/rollback.
  Future<void> commit();

  /// Undoes all changes made in the current transaction.
  Future<void> rollback();

  /// Closes the connection.
  Future<void> close();

  /// Checks if the connection is closed.
  Future<bool> isClosed();

  /// Gets the metadata of the connection.
  Future<ResultSetMetaData> getMetaData();
}
