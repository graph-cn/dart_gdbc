part of dart_gdbc;

abstract class ResultSet {
  bool success = false;

  List<ValueMetaData> get metas;

  List<List<dynamic>> get rows;

  List<String?> get columns => metas.map((e) => e.name).toList();

  @override
  String toString() {
    return '$runtimeType{\n\tsuccess: $success,\n\tmetas: ${metas.map((e) => e.toJson()).toList()},\n\tcolumns: $columns,\n\trows: ${jsonEncode(rows)}\n}';
  }
}
