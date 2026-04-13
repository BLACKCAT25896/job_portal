class TaxBody {
  String? name;
  String? regNo;
  String? type;
  String? value;
  bool? isDefault;
  int? status;
  String? method;

  TaxBody(
      {this.name,
        this.regNo,
        this.type,
        this.value,
        this.isDefault,
        this.status,
        this.method
      });

  TaxBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    regNo = json['reg_no'];
    type = json['type'];
    value = json['value'];
    isDefault = json['is_default'];
    status = json['status'];
    method = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['reg_no'] = regNo;
    data['type'] = type;
    data['value'] = value;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['_method'] = method;
    return data;
  }
}
