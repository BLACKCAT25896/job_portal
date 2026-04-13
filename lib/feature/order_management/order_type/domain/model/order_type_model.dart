
import 'package:ecommerce/helper/price_converter.dart';

class OrderTypeItem {
  int? id;
  String? name;
  int? status;

  OrderTypeItem({this.id, this.name, this.status});

  OrderTypeItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}

