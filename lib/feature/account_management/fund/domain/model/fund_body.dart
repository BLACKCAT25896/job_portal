class FundBody {
  String? name;
  String? code;
  String? type;
  String? openingBalance;
  String? currentBalance;
  int? status;
  String? sMethod;

  FundBody(
      {this.name,
        this.code,
        this.type,
        this.openingBalance,
        this.currentBalance,
        this.status,
        this.sMethod
      });

  FundBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    type = json['type'];
    openingBalance = json['opening_balance'];
    currentBalance = json['current_balance'];
    status = json['status'];
    sMethod = json['_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['type'] = type;
    data['opening_balance'] = openingBalance;
    data['current_balance'] = currentBalance;
    data['status'] = status;
    data['_method'] = sMethod;
    return data;
  }
}
