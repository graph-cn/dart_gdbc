// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of dart_gdbc;

mixin HasPool<T extends Pooled> {
  /// 空闲资源数
  ///
  /// 空閒資源數
  ///
  /// Idle resource count
  int idleCount = 0;

  /// 资源池
  ///
  /// 資源池
  ///
  /// Resource pool
  final Queue<T> pool = Queue<T>();

  /// 池化配置
  ///
  /// 池化配置
  ///
  /// Pooled config
  PoolConfig config = PoolConfig();

  /// 从池中获取一个实例
  ///
  /// 從池中獲取一個實例
  ///
  /// Get an instance from the pool
  Future<T> get instance async => pool.first;

  /// 归还资源
  ///
  /// 歸還資源
  ///
  /// Return resource
  void returnObj(T obj) {
    idleCount++;
  }
}
