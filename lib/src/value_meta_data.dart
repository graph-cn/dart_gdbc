part of dart_gdbc;

class ValueMetaData {
  late GdbTypes? type;
  String? name;
  final List<ValueMetaData> submetas = [];

  addSubmeta(ValueMetaData submeta) {
    var idx =
        submetas.lastIndexWhere((element) => element.name == submeta.name);
    if (idx == -1) {
      submetas.add(submeta);
      return submetas.length - 1;
    }
    return idx;
  }

  @override
  String toString() {
    return '$runtimeType{type: $type, name: $name, submetas: $submetas}';
  }

  Map<String, dynamic> toJson() {
    return {
      "'type'": type?.index,
      "'name'": "'$name'",
      "'submetas'": submetas.map((e) => e.toJson()).toList(),
    };
  }
}
