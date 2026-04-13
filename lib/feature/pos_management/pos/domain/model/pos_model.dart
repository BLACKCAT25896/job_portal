
import 'package:ecommerce/helper/price_converter.dart';


class PosItem {
  int? id;
  int? ecommerceId;
  String? name;
  String? description;
  int? categoryId;
  String? foodType;
  int? isParty;
  int? isDinner;
  int? isLunch;
  String? image;
  String? cookingTime;
  int? customQuantity;
  String? components;
  String? notes;
  String? vat;
  String? pst;
  int? status;
  String? createdAt;
  String? updatedAt;
  Category? category;
  String? defaultVariant;
  List<Availabilities>? availabilities;
  List<Addons>? addons;

  PosItem(
      {this.id,
        this.ecommerceId,
        this.name,
        this.description,
        this.categoryId,
        this.foodType,
        this.isParty,
        this.isDinner,
        this.isLunch,
        this.image,
        this.cookingTime,
        this.customQuantity,
        this.components,
        this.notes,
        this.vat,
        this.pst,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.defaultVariant,
        this.availabilities,
        this.addons});

  PosItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ecommerceId = json['ecommerce_id'];
    name = json['name'];
    description = json['description'];
    categoryId = json['category_id'];
    foodType = json['food_type'];
    isParty = json['is_party'];
    isDinner = json['is_dinner'];
    isLunch = json['is_lunch'];
    image = json['image'];
    cookingTime = json['cooking_time'];
    customQuantity = json['custom_quantity'];
    components = json['components'];
    notes = json['notes'];
    vat = json['vat'];
    pst = json['pst'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;

    defaultVariant = json['default_variant'];
    if (json['availabilities'] != null) {
      availabilities = <Availabilities>[];
      json['availabilities'].forEach((v) {
        availabilities!.add(Availabilities.fromJson(v));
      });
    }
    if (json['addons'] != null) {
      addons = <Addons>[];
      json['addons'].forEach((v) {
        addons!.add(Addons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ecommerce_id'] = ecommerceId;
    data['name'] = name;
    data['description'] = description;
    data['category_id'] = categoryId;
    data['food_type'] = foodType;
    data['is_party'] = isParty;
    data['is_dinner'] = isDinner;
    data['is_lunch'] = isLunch;
    data['image'] = image;
    data['cooking_time'] = cookingTime;
    data['custom_quantity'] = customQuantity;
    data['components'] = components;
    data['notes'] = notes;
    data['vat'] = vat;
    data['pst'] = pst;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }

    data['default_variant'] = defaultVariant;
    if (availabilities != null) {
      data['availabilities'] =
          availabilities!.map((v) => v.toJson()).toList();
    }
    if (addons != null) {
      data['addons'] = addons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  int? ecommerceId;
  String? name;
  String? image;
  int? parentId;
  int? isOffer;
  String? startDate;
  String? endDate;
  int? status;

  Category(
      {this.id,
        this.ecommerceId,
        this.name,
        this.image,
        this.parentId,
        this.isOffer,
        this.startDate,
        this.endDate,
        this.status,t});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ecommerceId = json['ecommerce_id'];
    name = json['name'];
    image = json['image'];
    parentId = json['parent_id'];
    isOffer = json['is_offer'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ecommerce_id'] = ecommerceId;
    data['name'] = name;
    data['image'] = image;
    data['parent_id'] = parentId;
    data['is_offer'] = isOffer;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    return data;
  }
}



class Availabilities {
  int? id;
  int? ecommerceId;
  int? foodId;
  String? availableDay;
  String? startDate;
  String? endDate;
  int? status;

  Availabilities(
      {this.id,
        this.ecommerceId,
        this.foodId,
        this.availableDay,
        this.startDate,
        this.endDate,
        this.status,});

  Availabilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ecommerceId = json['ecommerce_id'];
    foodId = json['food_id'];
    availableDay = json['available_day'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ecommerce_id'] = ecommerceId;
    data['food_id'] = foodId;
    data['available_day'] = availableDay;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    return data;
  }
}

class Addons {
  int? id;
  int? ecommerceId;
  String? name;
  double? price;
  double? vat;
  String? pst;
  int? status;

  Addons(
      {this.id,
        this.ecommerceId,
        this.name,
        this.price,
        this.vat,
        this.pst,
        this.status,});

  Addons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ecommerceId = json['ecommerce_id'];
    name = json['name'];
    price = PriceConverter.parseAmount(json['price']);
    vat = PriceConverter.parseAmount(json['vat']);
    pst = json['pst'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ecommerce_id'] = ecommerceId;
    data['name'] = name;
    data['price'] = price;
    data['vat'] = vat;
    data['pst'] = pst;
    data['status'] = status;
    return data;
  }
}
