
import 'package:ecommerce/helper/price_converter.dart';

class CareerLevelItem {
  int? id;
  String? name;
  int? status;

  CareerLevelItem(
      {this.id,
        this.name,
        this.status,});

  CareerLevelItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
