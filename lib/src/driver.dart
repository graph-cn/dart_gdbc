// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of dart_gdbc;

/// A [Driver] is a software component enabling a [Connection] to a database.
/// ---
/// 數據庫驅動接口，提供兩個方法：
/// * 給定 url 的格式，通過 url 格式來確定使用的驅動
/// * 通過 url 和 properties 來創建一個 [Connection]
///---
/// 数据库驱动接口，提供两个方法：
/// * 给定 url 的格式，通过 url 格式来确定使用的驱动
/// * 通过 url 和 properties 来创建一个 [Connection]
abstract class Driver with HasDataSource {
  /// Attempts to make a database connection to the given URL.
  /// ---
  /// 嘗試通過給定的 url 來創建一個數據庫連接。
  /// ---
  /// 尝试通过给定的 url 来创建一个数据库连接。
  Future<Connection> connect(String url, {Map<String, dynamic> properties});

  /// Retrieves whether the driver thinks that it can open a connection to the given URL.
  /// ---
  /// 獲取驅動程序是否認為它可以打開到給定URL的連接。
  /// ---
  /// 获取驱动程序是否认为它可以打开到给定URL的连接。
  bool acceptsURL(String url);
}
