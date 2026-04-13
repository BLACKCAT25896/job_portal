import 'package:ecommerce/helper/price_converter.dart';

class DamageModel {
  bool? status;
  String? message;
  Data? data;

  DamageModel({this.status, this.message, this.data});

  DamageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  DamageData? data;
  Meta? meta;

  Data({this.data, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DamageData.fromJson(json['data']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class DamageData {
  int? currentPage;
  List<DamageItem>? data;
  int? total;

  DamageData(
      {this.currentPage,
        this.data,
        this.total});

  DamageData.fromJson(Map<String, dynamic> json) {
    currentPage = PriceConverter.parseInt(json['current_page']);
    if (json['data'] != null) {
      data = <DamageItem>[];
      json['data'].forEach((v) {
        data!.add(DamageItem.fromJson(v));
      });
    }
    total = PriceConverter.parseInt(json['total']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class DamageItem {
  int? id;
  String? image;
  String? quantity;
  double? unitCost;
  double? totalCost;
  String? reason;
  ReportedBy? reportedBy;
  String? reportedDate;
  String? createdAt;
  ProductVariant? productVariant;

  DamageItem(
      {this.id,
        this.image,
        this.quantity,
        this.unitCost,
        this.totalCost,
        this.reason,
        this.reportedBy,
        this.reportedDate,
        this.createdAt,
        this.productVariant});

  DamageItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    image = json['image'];
    quantity = json['quantity'];
    unitCost = PriceConverter.parseAmount(json['unit_cost']);
    totalCost = PriceConverter.parseAmount(json['total_cost']);
    reason = json['reason'];
    reportedBy = json['reported_by'] != null
        ? ReportedBy.fromJson(json['reported_by'])
        : null;
    reportedDate = json['reported_date'];
    createdAt = json['created_at'];
    productVariant = json['product_variant'] != null
        ? ProductVariant.fromJson(json['product_variant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['quantity'] = quantity;
    data['unit_cost'] = unitCost;
    data['total_cost'] = totalCost;
    data['reason'] = reason;
    if (reportedBy != null) {
      data['reported_by'] = reportedBy!.toJson();
    }
    data['reported_date'] = reportedDate;
    data['created_at'] = createdAt;
    if (productVariant != null) {
      data['product_variant'] = productVariant!.toJson();
    }
    return data;
  }
}

class ReportedBy {
  int? id;
  String? firstName;

  ReportedBy({this.id, this.firstName});

  ReportedBy.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    firstName = json['first_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    return data;
  }
}

class ProductVariant {
  int? id;
  String? name;

  ProductVariant({this.id, this.name});

  ProductVariant.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}



class Meta {
  int? totalDamageQty;
  double? totalDamageValue;
  int? totalRecords;

  Meta({this.totalDamageQty, this.totalDamageValue, this.totalRecords});

  Meta.fromJson(Map<String, dynamic> json) {
    totalDamageQty = PriceConverter.parseInt(json['total_damage_qty']);
    totalDamageValue = PriceConverter.parseAmount(json['total_damage_value']);
    totalRecords = PriceConverter.parseInt(json['total_records']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_damage_qty'] = totalDamageQty;
    data['total_damage_value'] = totalDamageValue;
    data['total_records'] = totalRecords;
    return data;
  }
}
