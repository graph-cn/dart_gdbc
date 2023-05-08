part of dart_gdbc;

abstract class ResultSet {
  bool success = true;

  List<ValueMetaData> get metas;

  List<List<dynamic>> get rows;

  List<String?> get columns => metas.map((e) => e.name).toList();

  @override
  String toString() {
    return '$runtimeType{\n\tsuccess: $success,\n\tmetas: ${metas.map((e) => e.toJson()).toList()},\n\tcolumns: $columns,\n\trows: ${jsonEncode(rows)}\n}';
  }

  ValueMetaData? meta(List<int> indexes, [List<ValueMetaData>? metas]) {
    indexes = [...indexes];
    metas ??= this.metas;
    if (indexes.isEmpty) {
      return null;
    }

    var currentLevelColumnIndex = indexes.removeAt(0);
    if (indexes.isEmpty) {
      return metas[currentLevelColumnIndex];
    } else {
      return meta(indexes, metas[currentLevelColumnIndex].submetas);
    }
  }

  dynamic value(List<int> colIndexes,
      [int rowIndex = 0, List<dynamic>? values]) {
    colIndexes = [...colIndexes];
    values ??= rows[rowIndex];
    if (colIndexes.isEmpty) {
      return null;
    }

    var c = colIndexes.removeAt(0);
    if (colIndexes.isEmpty) {
      return values[c];
    } else {
      return value(colIndexes, values[c]);
    }
  }
}
