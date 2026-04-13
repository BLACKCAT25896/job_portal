class AccountBodyModel {
  String? name;
  String? code;
  String? type;
  String? openingBalance;
  String? currentBalance;
  int? status;

  AccountBodyModel(
      {this.name,
        this.code,
        this.type,
        this.openingBalance,
        this.currentBalance,
        this.status});

  AccountBodyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    type = json['type'];
    openingBalance = json['opening_balance'];
    currentBalance = json['current_balance'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['type'] = type;
    data['opening_balance'] = openingBalance;
    data['current_balance'] = currentBalance;
    data['status'] = status;
    return data;
  }
}
