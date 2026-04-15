
import 'package:mighty_job/helper/price_converter.dart';

class SalaryCurrencyItem {
  int? id;
  String? currencyName;
  String? currencyCode;
  String? currencyIcon;
  int? isDefault;
  int? status;

  SalaryCurrencyItem(
      {this.id,
        this.currencyName,
        this.currencyCode,
        this.currencyIcon,
        this.isDefault,
        this.status,
        });

  SalaryCurrencyItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    currencyName = json['currency_name'];
    currencyCode = json['currency_code'];
    currencyIcon = json['currency_icon'];
    isDefault = PriceConverter.parseInt(json['is_default']);
    status = PriceConverter.parseInt(json['status']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['currency_name'] = currencyName;
    data['currency_code'] = currencyCode;
    data['currency_icon'] = currencyIcon;
    data['is_default'] = isDefault;
    data['status'] = status;
    return data;
  }
}

