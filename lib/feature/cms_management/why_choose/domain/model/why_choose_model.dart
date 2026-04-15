

import 'package:mighty_job/helper/price_converter.dart';

class WhyChooseItem {
  int? id;
  int? instituteId;
  String? title;
  String? description;
  String? icon;
  int? status;
  String? createdAt;

  WhyChooseItem(
      {this.id,
        this.instituteId,
        this.title,
        this.description,
        this.icon,
        this.status,
        this.createdAt});

  WhyChooseItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    title = json['title'];
    description = json['description'];
    icon = json['icon'];
    status = PriceConverter.parseInt(json['status']);
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['institute_id'] = instituteId;
    data['title'] = title;
    data['description'] = description;
    data['icon'] = icon;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}

