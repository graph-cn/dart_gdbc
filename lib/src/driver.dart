part of dart_gdbc;

abstract class Driver {
  Connection connect(String url, {Map<String, String> properties});

  bool acceptsURL(String url);
}
