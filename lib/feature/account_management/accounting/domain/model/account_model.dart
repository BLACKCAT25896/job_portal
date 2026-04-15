

import 'package:mighty_job/helper/price_converter.dart';

class AccountItem {
  String? id;
  String? name;
  String? code;
  String? type;
  double? openingBalance;
  double? currentBalance;
  String? status;
  String? createdAt;

  AccountItem(
      {this.id,
        this.name,
        this.code,
        this.type,
        this.openingBalance,
        this.currentBalance,
        this.status,
        this.createdAt,});

  AccountItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    code = json['code'].toString();
    type = json['type'].toString();
    openingBalance = PriceConverter.parseAmount(json['opening_balance']);
    currentBalance = PriceConverter.parseAmount(json['current_balance']);
    status = json['status'].toString();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['type'] = type;
    data['opening_balance'] = openingBalance;
    data['current_balance'] = currentBalance;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}