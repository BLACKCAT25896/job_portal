
import 'package:mighty_job/helper/price_converter.dart';

class SkillItem {
  int? id;
  String? name;
  String? description;
  int? status;

  SkillItem(
      {this.id,
        this.name,
        this.description,
        this.status,});

  SkillItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    description = json['description'];
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}
