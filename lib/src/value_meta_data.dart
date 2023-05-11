// Copyright (c) 2023- All dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of dart_gdbc;

class ValueMetaData {
  late GdbTypes? type;
  String? name;
  final List<ValueMetaData> submetas = [];

  /// add submeta (if absent) and return its index
  int addSubmeta(ValueMetaData submeta, List<dynamic>? values, dynamic val) {
    var idx = submetas.lastIndexWhere(
        (element) => element.name == submeta.name && submeta.name != null);
    if (idx == -1) {
      submetas.add(submeta);
      idx = submetas.length - 1;
    }
    if ((values?.length ?? 0) <= idx) {
      values?.length = idx + 1;
      values?[idx] = val;
    }
    return idx;
  }

  @override
  String toString() {
    return '$runtimeType{type: $type, name: $name, submetas: $submetas}';
  }

  Map<String, dynamic> toJson() {
    return {
      "'type'": '\'${type?.name}\'',
      "'name'": name != null ? "'$name'" : null,
      "'submetas'": submetas.map((e) => e.toJson()).toList(),
    };
  }
}
