

import 'package:ecommerce/helper/price_converter.dart';

class AttributeItem {
  int? id;
  String? slug;
  String? name;
  String? source;
  int? status;

  AttributeItem(
      {this.id,
        this.slug,
        this.name,
        this.source,
        this.status});

  AttributeItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    slug = json['slug'];
    name = json['name'];
    source = json['source'];
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['source'] = source;
    data['status'] = status;
    return data;
  }
}

