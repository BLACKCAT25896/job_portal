import 'package:ecommerce/helper/price_converter.dart';

class PagesItem {
  int? id;
  String? type;
  String? description;

  PagesItem(
      {
        this.id,
        this.type,
        this.description});

  PagesItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['description'] = description;
    return data;
  }
}


