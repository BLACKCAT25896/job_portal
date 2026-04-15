

import 'package:mighty_job/helper/price_converter.dart';

class SalaryPeriodItem {
  int? id;
  String? period;
  String? description;
  int? isDefault;
  int? status;

  SalaryPeriodItem(
      {this.id,
        this.period,
        this.description,
        this.isDefault,
        this.status,
        });

  SalaryPeriodItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    period = json['period'];
    description = json['description'];
    isDefault = PriceConverter.parseInt(json['is_default']);
    status = PriceConverter.parseInt(json['status']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['period'] = period;
    data['description'] = description;
    data['is_default'] = isDefault;
    data['status'] = status;
    return data;
  }
}

