part of dart_gdbc;

class DriverManager {
  static const String usrKey = 'username';
  static const String pwdKey = 'password';

  static final Map<String, Driver> _drivers = {};

  static void registerDriver(Driver driver, [String? driverId]) {
    _drivers[driverId ?? driver.runtimeType.toString()] = driver;
  }

  static Future<Connection> getConnection(
    String url, {
    Map<String, dynamic>? properties,
    String? username,
    String? password,
  }) async {
    var driver =
        _drivers.values.firstWhere((element) => element.acceptsURL(url));
    properties ??= {};
    if (username != null) {
      properties[usrKey] ??= username;
    }
    if (password != null) {
      properties[pwdKey] ??= password;
    }
    return await driver.connect(url, properties: properties);
  }
}
