// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../dart_gdbc.dart";

/// 连接池的配置
///
/// 連接池的配置
///
/// The configuration of the connection pool
class PoolConfig {
  PoolConfig({
    this.minSize = 3,
    this.maxSize = 5,
    this.idle = const Duration(minutes: 1),
    this.wait = const Duration(seconds: 6),
    this.waitInterval = const Duration(milliseconds: 10),
    this.lifetime = const Duration(seconds: 60),
    this.checkInterval = const Duration(seconds: 30),
    this.clearOnError = true,
    this.onClose,
  });

  String? url;
  Map<String, dynamic>? properties;

  /// 连接池最小连接数
  ///
  /// 連接池最小連接數
  ///
  /// The minimum number of connections in the connection pool
  final int minSize;

  /// 连接池最大连接数
  ///
  /// 連接池最大連接數
  ///
  /// The maximum number of connections in the connection pool
  final int maxSize;

  /// 连接闲置时间
  ///
  /// 連接閒置時間
  ///
  /// The idle time of the connection
  final Duration idle;

  /// 连接等待时间
  ///
  /// 連接等待時間
  ///
  /// The wait time of the connection
  final Duration wait;

  final Duration waitInterval;

  /// 连接生命周期
  ///
  /// 連接生命週期
  ///
  /// The lifetime of the connection
  final Duration lifetime;

  /// 连接池检查间隔
  ///
  /// 連接池檢查間隔
  ///
  /// The check interval of the connection pool
  final Duration checkInterval;

  /// 是否在报错时清除连接
  ///
  /// 是否在報錯時清除連接
  ///
  /// Whether to clear the connection when an error occurs
  final bool clearOnError;

  /// 当连接关闭时，执行的回调函数
  ///
  /// 當連接關閉時，執行的回調函數
  ///
  /// The callback function executed when a connection is closed
  final Function()? onClose;
}
