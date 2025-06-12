// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../dart_gdbc.dart";

abstract class ConnectionPool<T extends Pooled> extends Connection
    with HasPool<T>, HasDriver {
  ConnectionPool(PoolConfig? poolConfig, {super.onClose}) {
    config = poolConfig ?? PoolConfig();
  }

  Connection Function(T) get connectionGetter;

  Future<Connection> createConnection() {
    return DriverManager.getConnection(
      config.url!,
      properties: config.properties,
      onClose: config.onClose,
    );
  }

  Future<D> proxy<D>(Future<D> Function(Connection) method) async {
    var ist = await instance;
    var conn = connectionGetter(ist);
    try {
      var proxyResult = await method.call(conn);
      returnObj(ist);
      return proxyResult;
    } catch (e) {
      returnObj(ist);
      pool.remove(ist);
      rethrow;
    }
  }

  @override
  Future<Statement> createStatement() async {
    return proxy((conn) => conn.createStatement());
  }

  @override
  Future<ResultSet> executeQuery(String gql,
      {Map<String, dynamic>? params}) async {
    return proxy((conn) => conn.executeQuery(gql, params: params));
  }

  @override
  Future<int> executeUpdate(String gql) async {
    return proxy((conn) => conn.executeUpdate(gql));
  }

  @override
  Future<PreparedStatement> prepareStatement(String gql,
      {String Function(String p1, Map<String, dynamic>? p2)? render}) async {
    return proxy((conn) => conn.prepareStatement(gql, render: render));
  }

  @override
  Future<PreparedStatement> prepareStatementWithParameters(
      String gql, List<ParameterMetaData> parameters) async {
    return proxy(
      (conn) => conn.prepareStatementWithParameters(gql, parameters),
    );
  }

  @override
  Future<void> close() => throw UnimplementedError();

  @override
  Future<void> commit() => throw UnimplementedError();

  @override
  Future<bool> getAutoCommit() => throw UnimplementedError();

  @override
  Future<ResultSetMetaData> getMetaData() => throw UnimplementedError();

  @override
  Future<bool> isClosed() => throw UnimplementedError();

  @override
  Future<void> rollback() => throw UnimplementedError();

  @override
  Future<void> setAutoCommit(bool autoCommit) => throw UnimplementedError();
}
