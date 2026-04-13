import 'package:flutter_image_compress/flutter_image_compress.dart';

class ProductBody {
  int? brandId;
  int? unitId;
  String? name;
  String? slug;
  String? productType;
  String? shortDescription;
  String? description;
  String? vat;
  String? pst;
  int? isFeatured;
  int? isTrending;
  int? isBestSelling;
  int? isFlashDeal;
  int? isNew;
  int? isPublished;
  String? visibility;
  List<int>? categories;
  List<VariantData>? variants;
  int? totalStock;

  ProductBody(
      {
        this.brandId,
        this.unitId,
        this.name,
        this.slug,
        this.productType,
        this.shortDescription,
        this.description,
        this.vat,
        this.pst,
        this.isFeatured,
        this.isTrending,
        this.isBestSelling,
        this.isFlashDeal,
        this.isNew,
        this.isPublished,
        this.visibility,
        this.categories,
        this.variants,
        this.totalStock,
      });

  ProductBody.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    unitId = json['unit_id'];
    name = json['name'];
    slug = json['slug'];
    productType = json['product_type'];
    shortDescription = json['short_description'];
    description = json['description'];
    vat = json['vat'];
    pst = json['pst'];
    isFeatured = json['is_featured'];
    isTrending = json['is_trending'];
    isBestSelling = json['is_best_selling'];
    isFlashDeal = json['is_flash_deal'];
    isNew = json['is_new'];
    isPublished = json['is_published'];
    visibility = json['visibility'];
    categories = json['category_ids '].cast<int>();
    if (json['variants'] != null) {
      variants = <VariantData>[];
      json['variants'].forEach((v) {
        variants!.add(VariantData.fromJson(v));
      });
    }
    totalStock = json['total_stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand_id'] = brandId;
    data['unit_id'] = unitId;
    data['name'] = name;
    data['slug'] = slug;
    data['product_type'] = productType;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['vat'] = vat;
    data['pst'] = pst;
    data['is_featured'] = isFeatured;
    data['is_trending'] = isTrending;
    data['is_best_selling'] = isBestSelling;
    data['is_flash_deal'] = isFlashDeal;
    data['is_new'] = isNew;
    data['is_published'] = isPublished;
    data['visibility'] = visibility;
    data['category_ids '] = categories;
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    data['total_stock'] = totalStock;
    return data;
  }
}

class VariantData {
  int? id;
  String? name;
  String? sku;
  String? price;
  String? offerPrice;
  String? discount;
  String? stockQuantity;
  int? stockTracking;
  String? weight;
  String? image;
  XFile? imageFile;
  String? alertStockQuantity;
  int? isDefault;
  List<AttributeData>? attributes;

  VariantData(
      {this.id,
        this.name,
        this.sku,
        this.price,
        this.offerPrice,
        this.discount,
        this.stockQuantity,
        this.stockTracking,
        this.weight,
        this.image,
        this.imageFile,
        this.alertStockQuantity,
        this.isDefault,
        this.attributes});

  VariantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    price = json['price'];
    offerPrice = json['offer_price'];
    discount = json['discount'];
    stockQuantity = json['stock_quantity'];
    stockTracking = json['stock_tracking'];
    weight = json['weight'];
    image = json['image'];
    imageFile = json['image_file'];
    alertStockQuantity = json['alert_stock_quantity'];
    isDefault = json['is_default'];
    if (json['attributes'] != null) {
      attributes = <AttributeData>[];
      json['attributes'].forEach((v) {
        attributes!.add(AttributeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sku'] = sku;
    data['price'] = price;
    data['offer_price'] = offerPrice;
    data['discount'] = discount;
    data['stock_quantity'] = stockQuantity;
    data['stock_tracking'] = stockTracking;
    data['weight'] = weight;
    data['image'] = image;
    data['alert_stock_quantity'] = alertStockQuantity;
    data['is_default'] = isDefault;
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttributeData {
  int? attributeId;
  int? attributeValueId;

  AttributeData({this.attributeId, this.attributeValueId});

  AttributeData.fromJson(Map<String, dynamic> json) {
    attributeId = json['attribute_id'];
    attributeValueId = json['attribute_value_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attribute_id'] = attributeId;
    data['attribute_value_id'] = attributeValueId;
    return data;
  }
}
