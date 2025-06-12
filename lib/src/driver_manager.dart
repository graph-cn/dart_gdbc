// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../dart_gdbc.dart";

/// The basic service for managing a set of GDBC drivers.
/// Two things are supported in DriverManager:
/// * You can register a driver with the [DriverManager.registerDriver(driver)].
/// * You can request a connection using the [DriverManager.getConnection] method.
/// ---
/// 驅動程序管理器的基本服務。
/// DriverManager支持兩件事：
/// * 您可以使用[DriverManager.registerDriver(driver)]註冊驅動程序。
/// * 您可以使用[DriverManager.getConnection]方法請求連接。
///---
/// 驱动程序管理器的基本服务。
/// DriverManager支持两件事：
/// * 您可以使用[DriverManager.registerDriver(driver)]注册驱动程序。
/// * 您可以使用[DriverManager.getConnection]方法请求连接。
class DriverManager {
  static const String usrKey = 'username';
  static const String pwdKey = 'password';

  static final Map<String, Driver> _drivers = {};

  /// Register a driver with the driver manager.
  ///---
  /// 使用驱动程序管理器注册驱动程序。
  ///---
  /// 使用驅動程序管理器註冊驅動程序。
  static void registerDriver(Driver driver, [String? driverId]) {
    _drivers[driverId ?? driver.runtimeType.toString()] = driver;
  }

  /// Get a connection from the first driver that recognizes the given URL.
  /// username and password are optional, if you don't provide them in the url, you can provide them in the properties.
  /// ---
  /// 通過url獲取第一個格式相符的驅動程序的連接。
  /// username和password是可選的，可以通過 properties 傳入，可以通過 url 傳入。
  /// 不過通過 url 傳入的方式是不可靠的，依托具體的數據庫驅動包。
  /// ---
  /// 通过url获取第一个格式相符的驱动程序的连接。
  /// username和password是可选的，可以通过 properties 传入，可以通过 url 传入，
  /// 不过通过 url 传入的方式是不可靠的，依托具体的数据库驱动包。
  static Future<Connection> getConnection(
    String url, {
    Map<String, dynamic>? properties,
    String? username,
    String? password,
    ConnectionPool? pooledConnection,
    Function()? onClose,
  }) async {
    Driver? driver;
    try {
      driver = _drivers.values.firstWhere((element) => element.acceptsURL(url));
    } catch (e) {
      throw ArgumentError('No suitable driver found for $url');
    }
    properties ??= {};
    if (username != null) {
      properties[usrKey] ??= username;
    }
    if (password != null) {
      properties[pwdKey] ??= password;
    }

    if (pooledConnection != null) {
      pooledConnection.config.url = url;
      pooledConnection.config.properties = properties;
      pooledConnection.driver = driver;
      return pooledConnection;
    } else {
      return await driver.connect(
        url,
        properties: properties,
        onClose: onClose,
      );
    }
  }
}
