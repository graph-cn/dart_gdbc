// Copyright (c) 2023- All dart_gdbc_pool authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../dart_gdbc_pool.dart";

/// 状态化的连接池
///
/// 狀態化的連接池
///
/// Stateful connection pool
class StateConnectionPool extends ConnectionPool<StatePooled<Connection>> {
  StateConnectionPool({
    PoolConfig? config,
    super.onClose,
  }) : super(config) {
    intervalCheck();
  }

  /// 保持连接池的最小连接数
  ///
  /// 保持連接池的最小連接數
  ///
  /// Keep the minimum number of connections in the connection pool
  void keepPoolServe() async {
    while (pool.length < config.minSize) {
      var stateConn = await createStateConn();
      if (stateConn == null) break;
      pool.add(stateConn);
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
      idleFirst.origin?.close();
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
    while (pool.where((e) {
      var isOld = e.birth.add(config.lifetime).isBefore(DateTime.now());
      var isIdle = e.state == PooledState.idle;
      return isOld && isIdle;
    }).isNotEmpty) {
      var oldFirst = pool.firstWhere(
          (e) => e.birth.add(config.lifetime).isBefore(DateTime.now()));
      oldFirst.origin?.close();
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
    try {
      var stateConn = StatePooled<Connection>(config, () {
        return driver.connect(
          config.url!,
          properties: config.properties!,
          onClose: config.onClose,
        );
      });
      stateConn.origin = await stateConn.factory();
      idleCount++;
      return stateConn;
    } catch (e) {
      return null;
    }
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
        var stateConn = await createStateConn();
        if (stateConn == null) break;
        pool.add(stateConn);
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
  Future<void> close() async {
    await Future.any(pool.map((element) async => element.origin?.close()));
    onClose?.call();
  }

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
    if (pool.length < config.maxSize) {
      super.returnObj(obj);
    } else {
      obj.origin?.close();
      pool.remove(obj);
      idleCount--;
    }
  }

  @override
  String? get version =>
      pool.where((e) => e.origin?.version != null).firstOrNull?.origin?.version;

  @override
  String? get databaseName => throw DbFeatureException("连接池不直接持有表空间");
}
