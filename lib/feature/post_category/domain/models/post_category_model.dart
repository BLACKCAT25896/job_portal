

import 'package:mighty_job/helper/price_converter.dart';

class PostCategoryItem {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? isDefault;
  int? status;

  PostCategoryItem(
      {this.id,
        this.name,
        this.slug,
        this.description,
        this.isDefault,
        this.status,
        });

  PostCategoryItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    isDefault = PriceConverter.parseInt(json['is_default']);
    status = PriceConverter.parseInt(json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['is_default'] = isDefault;
    data['status'] = status;
    return data;
  }
}
