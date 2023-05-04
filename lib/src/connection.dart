part of dart_gdbc;

abstract class Connection {
  Future<Statement> createStatement();

  Future<PreparedStatement> prepareStatement(String gql);

  Future<PreparedStatement> prepareStatementWithParameters(
      String gql, List<ParameterMetaData> parameters);

  Future<ResultSet> executeQuery(String gql);

  Future<int> executeUpdate(String gql);

  Future<bool> getAutoCommit();

  Future<void> setAutoCommit(bool autoCommit);

  Future<void> commit();

  Future<void> rollback();

  Future<void> close();

  Future<bool> isClosed();

  Future<ResultSetMetaData> getMetaData();
}
