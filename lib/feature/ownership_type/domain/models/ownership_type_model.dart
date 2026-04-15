
import 'package:mighty_job/helper/price_converter.dart';

class OwnershipTypeItem {
  int? id;
  String? name;
  int? status;

  OwnershipTypeItem(
      {this.id,
        this.name,
        this.status,});

  OwnershipTypeItem.fromJson(Map<String, dynamic> json) {
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
