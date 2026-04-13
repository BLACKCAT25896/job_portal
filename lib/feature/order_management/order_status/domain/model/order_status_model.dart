
import 'package:ecommerce/helper/price_converter.dart';

class OrderStatusItem {
  int? id;
  String? name;
  int? status;

  OrderStatusItem({this.id, this.name, this.status});

  OrderStatusItem.fromJson(Map<String, dynamic> json) {
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

