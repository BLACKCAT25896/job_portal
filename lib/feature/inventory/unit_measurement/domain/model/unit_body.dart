class UnitBody {
  String? name;
  String? shortName;
  String? type;
  int? baseUnitId;
  String? operator;
  int? operatorValue;
  int? priority;
  int? version;
  int? isDefault;
  int? status;
  String? sMethod;

  UnitBody(
      {this.name,
        this.shortName,
        this.type,
        this.baseUnitId,
        this.operator,
        this.operatorValue,
        this.priority,
        this.version,
        this.isDefault,
        this.status,
        this.sMethod,
      });

  UnitBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortName = json['short_name'];
    type = json['type'];
    baseUnitId = json['base_unit_id'];
    operator = json['operator'];
    operatorValue = json['operator_value'];
    priority = json['priority'];
    version = json['version'];
    isDefault = json['is_default'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['short_name'] = shortName;
    data['type'] = type;
    data['base_unit_id'] = baseUnitId;
    data['operator'] = operator;
    data['operator_value'] = operatorValue;
    data['priority'] = priority;
    data['version'] = version;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
