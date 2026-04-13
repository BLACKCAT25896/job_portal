

import 'package:ecommerce/feature/inventory/brand/domain/models/brand_model.dart';
import 'package:ecommerce/feature/inventory/category/domain/models/category_model.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/domain/model/unit_model.dart';
import 'package:ecommerce/helper/parse_image_helper.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:flutter/material.dart';

class Product {
  int? id;
  String? name;
  String? slug;
  String? sku;
  String? shortDescription;
  String? description;
  String? productType;
  int? totalStock;
  int? stockStatus;
  double? vat;
  double? pst;
  double? points;
  bool? isFeatured;
  bool? isTrending;
  bool? isNew;
  bool? isPublished;
  String? visibility;
  String? thumbnail;
  List<String>? gallery;
  int? status;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  String? canonicalUrl;
  int? views;
  int? salesCount;
  BrandItem? brand;
  List<CategoryItem>? category;
  UnitItem? unit;
  List<Variants>? variants;
  Variants? defaultVariant;
  int? quantity;
  TextEditingController? qtyController;

  Product(
      {this.id,
        this.name,
        this.slug,
        this.sku,
        this.shortDescription,
        this.description,
        this.productType,
        this.totalStock,
        this.stockStatus,
        this.vat,
        this.pst,
        this.points,
        this.isFeatured,
        this.isTrending,
        this.isNew,
        this.isPublished,
        this.visibility,
        this.thumbnail,
        this.gallery,
        this.status,
        this.metaTitle,
        this.metaKeywords,
        this.metaDescription,
        this.canonicalUrl,
        this.views,
        this.salesCount,
        this.category,
        this.brand,
        this.unit,
        this.variants,
        this.defaultVariant,
        this.quantity
      }){
    qtyController = TextEditingController(text: (quantity ?? 1).toString());
  }
  void updateController() {
    qtyController?.text = (quantity ?? 1).toString();
  }
  void disposeController() {
    qtyController?.dispose();
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    sku = json['sku'];
    shortDescription = json['short_description'];
    description = json['description'];
    productType = json['product_type'];
    totalStock = PriceConverter.parseInt(json['total_stock']);
    stockStatus = PriceConverter.parseInt(json['stock_status']);
    vat = PriceConverter.parseAmount(json['vat']);
    pst = PriceConverter.parseAmount(json['pst']);
    points = PriceConverter.parseAmount(json['points']);
    isFeatured = PriceConverter.parseBool(json['is_featured']);
    isTrending = PriceConverter.parseBool(json['is_trending']);
    isNew = PriceConverter.parseBool(json['is_new']);
    isPublished = PriceConverter.parseBool(json['is_published']);
    visibility = json['visibility'];
    thumbnail = json['thumbnail'];
    gallery = parseImages(json['gallery']);
    status = PriceConverter.parseInt(json['status']);
    metaTitle = json['meta_title'];
    // metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    canonicalUrl = json['canonical_url'];
    views = PriceConverter.parseInt(json['views']);
    salesCount = PriceConverter.parseInt(json['sales_count']);
    brand = json['brand'] != null ? BrandItem.fromJson(json['brand']) : null;
    if (json['category'] != null) {
      category = <CategoryItem>[];
      json['category'].forEach((v) {
        category!.add(CategoryItem.fromJson(v));
      });
    }
    unit = json['unit'] != null ? UnitItem.fromJson(json['unit']) : null;

    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    defaultVariant = json['default_variant'] != null
        ? Variants.fromJson(json['default_variant'])
        : null;
    quantity =  json['quantity'] ?? 1;
    qtyController = TextEditingController(text: quantity.toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['sku'] = sku;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['product_type'] = productType;
    data['total_stock'] = totalStock;
    data['stock_status'] = stockStatus;
    data['vat'] = vat;
    data['pst'] = pst;
    data['points'] = points;
    data['is_featured'] = isFeatured;
    data['is_trending'] = isTrending;
    data['is_new'] = isNew;
    data['is_published'] = isPublished;
    data['visibility'] = visibility;
    data['thumbnail'] = thumbnail;
    data['gallery'] = gallery;
    data['status'] = status;
    data['meta_title'] = metaTitle;
    data['meta_keywords'] = metaKeywords;
    data['meta_description'] = metaDescription;
    data['canonical_url'] = canonicalUrl;
    data['views'] = views;
    data['sales_count'] = salesCount;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (unit != null) {
      data['unit'] = unit!.toJson();
    }
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    if (defaultVariant != null) {
      data['default_variant'] = defaultVariant!.toJson();
    }
    data['quantity'] = quantity;
    return data;
  }
}

class Variants {
  int? id;
  String? name;
  String? sku;
  String? barcode;
  double? purchasePrice;
  double? price;
  double? offerPrice;
  double? profitMargin;
  double? discount;
  double? stockQuantity;
  int? stockTracking;
  String? image;
  String? description;
  String? weight;
  int? alertStockQuantity;
  int? isActiveOffer;
  String? offerStartAt;
  String? offerEndAt;
  int? isDefault;
  int? status;
  List<Attributes>? attributes;
  List<AttributeValues>? attributeValues;
  bool? isSelected;

  Variants(
      {this.id,
        this.name,
        this.sku,
        this.barcode,
        this.purchasePrice,
        this.price,
        this.offerPrice,
        this.profitMargin,
        this.discount,
        this.stockQuantity,
        this.stockTracking,
        this.image,
        this.description,
        this.weight,
        this.alertStockQuantity,
        this.isActiveOffer,
        this.offerStartAt,
        this.offerEndAt,
        this.isDefault,
        this.status,
        this.attributes,
        this.attributeValues,
        this.isSelected
      });

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    barcode = json['barcode'];
    purchasePrice = PriceConverter.parseAmount(json['purchase_price']);
    price = PriceConverter.parseAmount(json['price']);
    offerPrice = PriceConverter.parseAmount(json['offer_price']);
    profitMargin = PriceConverter.parseAmount(json['profit_margin']);
    discount = PriceConverter.parseAmount(json['discount']);
    stockQuantity = PriceConverter.parseAmount(json['stock_quantity']);
    stockTracking = PriceConverter.parseInt(json['stock_tracking']);
    image = json['image'];
    description = json['description'];
    weight = json['weight'];
    alertStockQuantity = PriceConverter.parseInt(json['alert_stock_quantity']);
    isActiveOffer = PriceConverter.parseInt(json['is_active_offer']);
    offerStartAt = json['offer_start_at'];
    offerEndAt = json['offer_end_at'];
    isDefault = PriceConverter.parseInt(json['is_default']);
    status = PriceConverter.parseInt(json['status']);
    if (json['attribute_values'] != null) {
      attributeValues = <AttributeValues>[];
      json['attribute_values'].forEach((v) {
        attributeValues!.add(AttributeValues.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    isSelected = json['is_selected'] ?? false;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sku'] = sku;
    data['barcode'] = barcode;
    data['purchase_price'] = purchasePrice;
    data['price'] = price;
    data['offer_price'] = offerPrice;
    data['profit_margin'] = profitMargin;
    data['discount'] = discount;
    data['stock_quantity'] = stockQuantity;
    data['stock_tracking'] = stockTracking;
    data['image'] = image;
    data['description'] = description;
    data['weight'] = weight;
    data['alert_stock_quantity'] = alertStockQuantity;
    data['is_active_offer'] = isActiveOffer;
    data['offer_start_at'] = offerStartAt;
    data['offer_end_at'] = offerEndAt;
    data['is_default'] = isDefault;
    data['status'] = status;
    if (attributeValues != null) {
      data['attribute_values'] =
          attributeValues!.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }

    data['is_selected'] = isSelected;
    return data;
  }
}

class Attributes {
  int? attributeId;
  String? attributeName;
  int? attributeValueId;
  String? attributeValue;

  Attributes(
      {this.attributeId,
        this.attributeName,
        this.attributeValueId,
        this.attributeValue});

  Attributes.fromJson(Map<String, dynamic> json) {
    attributeId = PriceConverter.parseInt(json['attribute_id']);
    attributeName = json['attribute_name'];
    attributeValueId = PriceConverter.parseInt(json['attribute_value_id']);
    attributeValue = json['attribute_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attribute_id'] = attributeId;
    data['attribute_name'] = attributeName;
    data['attribute_value_id'] = attributeValueId;
    data['attribute_value'] = attributeValue;
    return data;
  }
}



class AttributeValues {
  int? id;
  String? value;
  String? source;
  int? status;
  String? externalId;
  Attribute? attribute;

  AttributeValues(
      {this.id,
        this.value,
        this.source,
        this.status,
        this.externalId,
        this.attribute});

  AttributeValues.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    value = json['value'];
    source = json['source'];
    status = PriceConverter.parseInt(json['status']);
    externalId = json['external_id'];
    attribute = json['attribute'] != null
        ? Attribute.fromJson(json['attribute'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    data['source'] = source;
    data['status'] = status;
    data['external_id'] = externalId;
    if (attribute != null) {
      data['attribute'] = attribute!.toJson();
    }
    return data;
  }
}


class Attribute {
  int? id;
  String? slug;
  String? name;
  String? source;

  Attribute(
      {this.id,
        this.slug,
        this.name,
        this.source});

  Attribute.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    slug = json['slug'];
    name = json['name'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['source'] = source;
    return data;
  }
}

class StockLedgers {
  int? productVariantId;
  int? warehouseId;
  String? newQty;
  Warehouse? warehouse;

  StockLedgers(
      {this.productVariantId, this.warehouseId, this.newQty, this.warehouse});

  StockLedgers.fromJson(Map<String, dynamic> json) {
    productVariantId = PriceConverter.parseInt(json['product_variant_id']);
    warehouseId = PriceConverter.parseInt(json['warehouse_id']);
    newQty = json['new_qty'];
    warehouse = json['warehouse'] != null
        ? Warehouse.fromJson(json['warehouse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_variant_id'] = productVariantId;
    data['warehouse_id'] = warehouseId;
    data['new_qty'] = newQty;
    if (warehouse != null) {
      data['warehouse'] = warehouse!.toJson();
    }
    return data;
  }
}

class Warehouse {
  int? id;
  int? userId;
  int? shopId;
  String? name;
  String? slug;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? latitude;
  String? longitude;
  String? managerName;
  int? capacity;
  int? isDefault;
  String? status;

  Warehouse(
      {this.id,
        this.userId,
        this.shopId,
        this.name,
        this.slug,
        this.email,
        this.phone,
        this.address,
        this.city,
        this.state,
        this.country,
        this.postalCode,
        this.latitude,
        this.longitude,
        this.managerName,
        this.capacity,
        this.isDefault,
        this.status});

  Warehouse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    name = json['name'];
    slug = json['slug'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postal_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    managerName = json['manager_name'];
    capacity = json['capacity'];
    isDefault = json['is_default'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['shop_id'] = shopId;
    data['name'] = name;
    data['slug'] = slug;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postal_code'] = postalCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['manager_name'] = managerName;
    data['capacity'] = capacity;
    data['is_default'] = isDefault;
    data['status'] = status;
    return data;
  }
}

