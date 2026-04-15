import 'package:mighty_job/helper/price_converter.dart';
class CategoryItem {
  int? id;
  String? name;
  String? slug;
  String? image;
  int? parentId;
  int? isOffer;
  int? isFeatured;
  int? isHot;
  String? startDate;
  String? endDate;
  int? status;
  int? productCount;

  CategoryItem(
      {this.id,
        this.name,
        this.slug,
        this.image,
        this.parentId,
        this.isOffer,
        this.isFeatured,
        this.isHot,
        this.startDate,
        this.endDate,
        this.status,
        this.productCount});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    parentId = PriceConverter.parseInt(json['parent_id']);
    isOffer = PriceConverter.parseInt(json['is_offer']);
    isFeatured = PriceConverter.parseInt(json['is_featured']);
    isHot = PriceConverter.parseInt(json['is_hot']);
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = PriceConverter.parseInt(json['status']);
    productCount = PriceConverter.parseInt(json['product_count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['parent_id'] = parentId;
    data['is_offer'] = isOffer;
    data['is_featured'] = isFeatured;
    data['is_hot'] = isHot;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['product_count'] = productCount;
    return data;
  }
}
