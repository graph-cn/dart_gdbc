// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of dart_gdbc;

enum GdbTypes {
  // types in graph database
  line,
  point,
  polygon,
  node,
  tag,
  prop,
  path,
  relationship,
  step,

  // basic types in dart
  bool,
  byte,
  short,
  int,
  long,
  float,
  double,

  bytes,
  string,

  date,
  time,
  dateTime,
  duration,

  list,
  map,
  set,
  none,

  unknown,
  dataSet,
}
