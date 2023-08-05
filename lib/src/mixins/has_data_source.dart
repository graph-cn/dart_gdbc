// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of dart_gdbc;

mixin HasDataSource {
  /// 数据源
  ///
  /// 數據源
  ///
  /// Data source
  DataSource? get dataSource => _dataSource;

  /// 数据源
  ///
  /// 數據源
  ///
  /// Data source
  DataSource? _dataSource;

  /// 设置数据源
  ///
  /// 設置數據源
  ///
  /// Set data source
  set dataSource(DataSource? dataSource) {
    if (_dataSource != null) {
      throw GdbcException(message: 'DataSource has been set');
    }
    _dataSource = dataSource;
  }
}
