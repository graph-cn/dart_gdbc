// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../dart_gdbc.dart";

abstract class ResultSet {
  bool success = true;

  List<ValueMetaData> get metas;

  List<List<dynamic>> get rows;

  List<String?> get columns => metas.map((e) => e.name).toList();

  @override
  String toString() {
    return '$runtimeType{\n\tsuccess: $success,\n\tmetas: ${metas.map((e) => e.toJson()).toList()},\n\tcolumns: $columns,\n\trows: $rows\n}';
  }

  ValueMetaData? meta(List<int> indexes, [List<ValueMetaData>? metas]) {
    indexes = [...indexes];
    metas ??= this.metas;
    if (indexes.isEmpty || metas.isEmpty) {
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
      [int rowIndex = 0, Iterable<dynamic>? values]) {
    colIndexes = [...colIndexes];
    values ??= rows[rowIndex];
    if (colIndexes.isEmpty || values.isEmpty) {
      return null;
    }

    var c = colIndexes.removeAt(0);
    if (colIndexes.isEmpty) {
      return values.map((e) => e).toList()[c];
    } else {
      return value(colIndexes, rowIndex, values.map((e) => e).toList()[c]);
    }
  }
}
