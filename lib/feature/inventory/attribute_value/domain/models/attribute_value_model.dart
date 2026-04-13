

import 'package:ecommerce/helper/price_converter.dart';
class AttributeValueItem {
  int? id;
  int? attributeId;
  String? attributeName;
  String? value;
  int? status;

  AttributeValueItem(
      {this.id,
        this.attributeId,
        this.attributeName,
        this.value,
        this.status});

  AttributeValueItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    attributeId = PriceConverter.parseInt(json['attribute_id']);
    attributeName = json['attribute_name'];
    value = json['value'];
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attribute_id'] = attributeId;
    data['attribute_name'] = attributeName;
    data['value'] = value;
    data['status'] = status;
    return data;
  }
}
