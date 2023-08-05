// Copyright (c) 2023- All dart_gdbc_pool authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

import 'dart:isolate';

import 'package:test/test.dart';

main() {
  test('test name', () {
    multiThread();
  });
}

void multiThread() async {
  print('start ');
  print('当前：${Isolate.current.debugName}');
  Isolate isolate = await Isolate.spawn(newThread, 'testtt');
  print('end');
  isolate.kill();
}

void newThread(String msg) {
  print('当前：${Isolate.current.debugName}');
  print(msg);
}
