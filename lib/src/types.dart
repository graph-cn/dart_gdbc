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
