part of dart_gdbc;

abstract class PreparedStatement extends Statement {
  Future<bool> execute([String gql, Map<String, dynamic>? params]);

  Future<ResultSet> executeQuery([String gql, Map<String, dynamic>? params]);

  Future<int> executeUpdate(String gql, [Map<String, dynamic>? params]);
}
