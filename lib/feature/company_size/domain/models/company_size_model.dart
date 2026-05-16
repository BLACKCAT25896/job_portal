
import 'package:job/helper/price_converter.dart';

class CompanySizeItem {
  int? id;
  String? name;
  String? slug;
  int? minSize;
  int? maxSize;

  CompanySizeItem(
      {this.id,
        this.name,
        this.slug,
        this.minSize,
        this.maxSize,
      });

  CompanySizeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    minSize = PriceConverter.parseInt(json['min_size']);
    maxSize = PriceConverter.parseInt(json['max_size']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['min_size'] = minSize;
    data['max_size'] = maxSize;
    return data;
  }
}

