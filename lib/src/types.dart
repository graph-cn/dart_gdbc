// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../dart_gdbc.dart";

abstract class MetaKey {
  static String nodeId = '_id';
  static String relationshipId = '_rId';
  static String startId = '_startId';
  static String endId = '_endId';
  static String startNode = '_start';
  static String endNode = '_end';
  static String steps = '_steps';
}

enum GdbTypes {
  // types in graph database
  none,
  node,
  relationship,
  path,
  prop,
  step,
  dataSet,

  list,
  map,
  set,

  // basic types in dart
  bool,
  byte,
  short,
  int,
  long,
  float,
  double,
  decimal,

  bytes,
  string,

  date,
  time,
  zonedTime,
  dateTime,
  zonedDateTime,
  timestamp,
  duration,

  line,
  point,
  polygon,
  geo,

  embeddingVector,

  unknown,
}
