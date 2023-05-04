part of dart_gdbc;

abstract class Statement {
  Future<bool> execute([String gql]);

  Future<ResultSet> executeQuery([String gql]);

  Future<int> executeUpdate(String gql);
}
