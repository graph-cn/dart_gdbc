// Copyright (c) 2023- All dart_gdbc_pool authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../dart_gdbc_pool.dart";

class StatePooled<T> with Pooled<T> {
  PooledState state = PooledState.idle;

  /// 连接池配置
  ///
  /// 連接池配置
  ///
  /// Connection pool config
  @override
  final PoolConfig config;

  /// 上次使用时间
  ///
  /// 上次使用時間
  ///
  /// Last use time
  DateTime lastUse = DateTime.now();

  /// 对象创建工厂方法
  ///
  /// 對象創建工廠方法
  ///
  /// Object creation factory method
  @override
  Future<T> Function() factory;

  StatePooled(this.config, this.factory);

  @override
  String toString() {
    return 'IsolatePooled{origin: $origin, state: $state}';
  }
}

enum PooledState {
  idle,
  busy,
  closed,
}
