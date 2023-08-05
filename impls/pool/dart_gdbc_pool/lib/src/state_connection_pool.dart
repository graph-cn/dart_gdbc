// Copyright (c) 2023- All dart_gdbc_pool authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of dart_gdbc_pool;

/// 状态化的连接池
///
/// 狀態化的連接池
///
/// Stateful connection pool
class StateConnectionPool extends ConnectionPool<StatePooled<Connection>> {
  StateConnectionPool({PoolConfig? config}) : super(config) {
    intervalCheck();
  }

  /// 保持连接池的最小连接数
  ///
  /// 保持連接池的最小連接數
  ///
  /// Keep the minimum number of connections in the connection pool
  void keepPoolServe() async {
    while (pool.length < config.minSize) {
      pool.add(await createStateConn());
    }
  }

  /// 移除空闲太久的连接
  ///
  /// 移除閒置太久的連接
  ///
  /// Remove the connection that has been idle for too long
  void keepPoolUseful() {
    pool.removeWhere((e) {
      var isExtra = e.state == PooledState.idle &&
          e.lastUse.add(config.idle).isBefore(DateTime.now());
      if (isExtra) {
        idleCount--;
        e.origin?.close();
      }
      return isExtra;
    });
  }

  /// 移除多余的空闲连接
  ///
  /// 移除多餘的閒置連接
  ///
  /// Remove extra idle connections
  void keepPoolThin() {
    while (pool.where((e) => e.state == PooledState.idle).length >
        config.minSize) {
      var idleFirst = pool.firstWhere((e) => e.state == PooledState.idle);
      pool.remove(idleFirst);
      idleCount--;
    }
  }

  /// 移除创建时间太长的连接
  ///
  /// 移除創建時間太長的連接
  ///
  /// Remove connections that have been created for too long
  void keepPoolYound() {
    while (pool
        .where((e) =>
            e.birth.add(config.lifetime).isBefore(DateTime.now()) &&
            e.state == PooledState.idle)
        .isNotEmpty) {
      var oldFirst = pool.firstWhere(
          (e) => e.birth.add(config.lifetime).isBefore(DateTime.now()));
      pool.remove(oldFirst);
      idleCount--;
    }
  }

  /// 定时检查连接池
  ///
  /// 定時檢查連接池
  ///
  /// Regularly check the connection pool
  intervalCheck() {
    Timer.periodic(config.checkInterval, (timer) async {
      keepPoolUseful();
      keepPoolYound();
      keepPoolThin();
      keepPoolServe();
    });
  }

  /// 创建连接
  createStateConn() async {
    var stateConn = StatePooled<Connection>(config, () {
      return driver.connect(config.url!, properties: config.properties!);
    });
    stateConn.origin = await stateConn.factory();
    idleCount++;
    return stateConn;
  }

  /// 获取连接
  ///
  /// 獲取連接
  ///
  /// Get connection
  @override
  Future<StatePooled<Connection>> get instance async {
    var standingTime = DateTime.now();
    // 根据 config 获取连接，是从 pool 中获取，还是新建
    var statePooled =
        pool.where((stateConn) => stateConn.state == PooledState.idle);
    while (standingTime.add(config.wait).isAfter(DateTime.now()) &&
        statePooled.isEmpty) {
      if (pool.length < config.maxSize) {
        pool.add(await createStateConn());
      } else {
        await Future.delayed(config.waitInterval);
      }
      statePooled =
          pool.where((stateConn) => stateConn.state == PooledState.idle);
    }
    if (statePooled.isEmpty) {
      throw Exception('No available connection');
    }
    return statePooled.first..state = PooledState.busy;
  }

  /// 关闭连接池
  ///
  /// 關閉連接池
  ///
  /// Close the connection pool
  @override
  Future<void> close() =>
      Future.any(pool.map((element) async => element.origin?.close()));

  /// 获取连接的方法
  ///
  /// 獲取連接的方法
  ///
  /// Method of getting connection
  @override
  Connection Function(StatePooled<Connection>) get connectionGetter =>
      (StatePooled<Connection> stateConn) {
        stateConn.state = PooledState.busy;
        idleCount--;
        return stateConn.origin!;
      };

  /// 归还连接
  ///
  /// 歸還連接
  ///
  /// Return connection
  @override
  void returnObj(StatePooled<Connection> obj) {
    obj.state = PooledState.idle;
    super.returnObj(obj);
  }
}
