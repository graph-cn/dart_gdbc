// Copyright (c) 2023- All dart_gdbc_pool authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

import 'package:dart_gdbc/dart_gdbc.dart';
import 'package:dart_gdbc_pool/dart_gdbc_pool.dart';

main() async {
  var dm = await DriverManager.getConnection(
    "db's url",
    username: "username",
    password: "password",
    pooledConnection: StateConnectionPool(
      config: PoolConfig(
        minSize: 1,
        maxSize: 10,
        idle: const Duration(minutes: 2),
        checkInterval: const Duration(seconds: 5 * 60 - 1),
        lifetime: const Duration(minutes: 5),
      ),
    ),
  );
  dm.executeQuery("cypher ...");
}
