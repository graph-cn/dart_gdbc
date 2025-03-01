// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
import 'package:dart_gdbc/dart_gdbc.dart';

void main() async {
  DriverManager.registerDriver(SampleDriver());
  var conn = await DriverManager.getConnection('gdbc.dbname://ip:port/dbname');
  conn.createStatement();
  ResultSet rs = await conn.executeQuery('MATCH (n) RETURN n');
  print(rs);
}

class SampleDriver extends Driver {
  @override
  bool acceptsURL(String url) {
    return url.startsWith('gdbc.dbname://');
  }

  @override
  Future<Connection> connect(String url, {Map<String, dynamic>? properties}) {
    return Future.value(SampleConnection());
  }
}

class SampleStatement extends Statement {
  @override
  Future<bool> execute({String? gql, Map<String, dynamic>? params}) {
    // TODO: implement execute
    throw UnimplementedError();
  }

  @override
  Future<ResultSet> executeQuery({String? gql, Map<String, dynamic>? params}) {
    print(gql);
    return Future.value(SampleResultSet());
  }

  @override
  Future<int> executeUpdate({String? gql, Map<String, dynamic>? params}) {
    // TODO: implement executeUpdate
    throw UnimplementedError();
  }
}

class SampleResultSet extends ResultSet {
  @override
  List<ValueMetaData> get metas => [];

  @override
  List<List> get rows => [];
}

class SampleConnection extends Connection {
  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<void> commit() {
    // TODO: implement commit
    throw UnimplementedError();
  }

  @override
  Future<Statement> createStatement() {
    return Future.value(SampleStatement());
  }

  @override
  Future<ResultSet> executeQuery(String? gql, {Map<String, dynamic>? params}) {
    return Future.value(SampleResultSet());
  }

  @override
  Future<int> executeUpdate(String gql) {
    // TODO: implement executeUpdate
    throw UnimplementedError();
  }

  @override
  Future<bool> getAutoCommit() {
    // TODO: implement getAutoCommit
    throw UnimplementedError();
  }

  @override
  Future<ResultSetMetaData> getMetaData() {
    // TODO: implement getMetaData
    throw UnimplementedError();
  }

  @override
  Future<bool> isClosed() {
    // TODO: implement isClosed
    throw UnimplementedError();
  }

  @override
  Future<PreparedStatement> prepareStatement(
    String gql, {
    String Function(String, Map<String, dynamic>)? render,
  }) {
    // TODO: implement prepareStatement
    throw UnimplementedError();
  }

  @override
  Future<PreparedStatement> prepareStatementWithParameters(
      String gql, List<ParameterMetaData> parameters) {
    // TODO: implement prepareStatementWithParameters
    throw UnimplementedError();
  }

  @override
  Future<void> rollback() {
    // TODO: implement rollback
    throw UnimplementedError();
  }

  @override
  Future<void> setAutoCommit(bool autoCommit) {
    // TODO: implement setAutoCommit
    throw UnimplementedError();
  }

  @override
  // TODO: implement databaseName
  String? get databaseName => throw UnimplementedError();
}
