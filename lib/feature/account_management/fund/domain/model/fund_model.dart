import 'package:ecommerce/helper/price_converter.dart';

class FundItem {
  int? id;
  String? name;
  String? type;
  String? code;
  double? openingBalance;
  double? currentBalance;
  String? isDefault;
  String? status;
  String? createdAt;

  FundItem(
      {this.id,
        this.name,
        this.type,
        this.code,
        this.openingBalance,
        this.currentBalance,
        this.isDefault,
        this.status,
        this.createdAt,});

  FundItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    type = json['type'];
    code = json['code'];
    openingBalance = PriceConverter.parseAmount(json['opening_balance']);
    currentBalance = PriceConverter.parseAmount(json['current_balance']);
    isDefault = json['is_default'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['code'] = code;
    data['opening_balance'] = openingBalance;
    data['current_balance'] = currentBalance;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
