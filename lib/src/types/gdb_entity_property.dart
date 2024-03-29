// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../dart_gdbc.dart";

abstract class GdbEntityProperty<T> {
  GdbTypes get type;
  String get name;
  T get value;
}
