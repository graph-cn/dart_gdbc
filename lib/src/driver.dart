part of dart_gdbc;

abstract class Driver {
  Future<Connection> connect(String url, {Map<String, dynamic> properties});

  bool acceptsURL(String url);
}
