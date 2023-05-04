part of dart_gdbc;

abstract class DataSource {
  Future<Connection> getConnection({String username, String password});
}
