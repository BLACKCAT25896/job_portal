import 'package:mighty_job/helper/price_converter.dart';

class UnitItem {
  int? id;
  String? name;
  String? code;
  int? status;

  UnitItem(
      {this.id,
        this.name,
        this.code,
        this.status,});

  UnitItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['status'] = status;
    return data;
  }
}