
import 'package:mighty_job/helper/price_converter.dart';

class TaxItem {
  int? id;
  String? name;
  String? regNo;
  String? type;
  String? value;
  int? isDefault;
  int? status;

  TaxItem(
      {this.id,
        this.name,
        this.regNo,
        this.type,
        this.value,
        this.isDefault,
        this.status,});

  TaxItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    regNo = json['reg_no'];
    type = json['type'];
    value = json['value'];
    isDefault = PriceConverter.parseInt(json['is_default']);
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['reg_no'] = regNo;
    data['type'] = type;
    data['value'] = value;
    data['is_default'] = isDefault;
    data['status'] = status;
    return data;
  }
}
