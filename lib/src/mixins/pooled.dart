// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../dart_gdbc.dart";

mixin Pooled<T> {
  T? origin;

  final DateTime birth = DateTime.now();

  PoolConfig get config;

  set config(PoolConfig config) => this.config = config;

  Future Function() get factory;

  final connectionEventListeners = <void Function(dynamic)>[];
}
