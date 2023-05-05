part of dart_gdbc;

abstract class GdbEntityProperty<T> {
  GdbTypes get type;
  String get name;
  T get value;
}
