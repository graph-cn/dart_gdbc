// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of dart_gdbc;

mixin HasDriver {
  /// 获取驱动
  ///
  /// 獲取驅動
  ///
  /// Get driver
  Driver get driver => _driver!;

  /// 驱动
  ///
  /// 驅動
  ///
  /// Driver
  Driver? _driver;

  /// 设置驱动
  ///
  /// 設置驅動
  ///
  /// Set driver
  set driver(Driver driver) {
    if (_driver != null) {
      throw GdbcException(message: 'Driver has been set');
    }
    _driver = driver;
  }
}
