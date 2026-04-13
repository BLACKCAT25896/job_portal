class PaymentMethodBody {
  String? name;
  String? type;
  String? credentials;
  int? isDefault;
  int? status;

  PaymentMethodBody(
      {this.name, this.type, this.credentials, this.isDefault, this.status});

  PaymentMethodBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    credentials = json['credentials'];
    isDefault = json['is_default'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['credentials'] = credentials;
    data['is_default'] = isDefault;
    data['status'] = status;
    return data;
  }
}
