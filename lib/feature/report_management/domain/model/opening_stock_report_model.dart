import 'package:mighty_job/helper/price_converter.dart';

class OpeningStockReportModel {
  bool? status;
  String? message;
  Data? data;

  OpeningStockReportModel({this.status, this.message, this.data});

  OpeningStockReportModel.fromJson(Map<String, dynamic> json) {
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
  String? startDate;
  List<OpeningStockReportItem>? data;

  Data({this.startDate, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    if (json['data'] != null) {
      data = <OpeningStockReportItem>[];
      json['data'].forEach((v) {
        data!.add(OpeningStockReportItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_date'] = startDate;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OpeningStockReportItem {
  int? productItemId;
  String? productName;
  String? thumbnail;
  int? openingStock;
  int? currentStock;
  double? unitCost;
  double? marketValue;

  OpeningStockReportItem(
      {this.productItemId,
        this.productName,
        this.thumbnail,
        this.openingStock,
        this.currentStock,
        this.unitCost,
        this.marketValue});

  OpeningStockReportItem.fromJson(Map<String, dynamic> json) {
    productItemId = PriceConverter.parseInt(json['product_item_id']);
    productName = json['product_name'];
    thumbnail = json['thumbnail'];
    openingStock = PriceConverter.parseInt(json['opening_stock']);
    currentStock = PriceConverter.parseInt(json['current_stock']);
    unitCost = PriceConverter.parseAmount(json['unit_cost']);
    marketValue = PriceConverter.parseAmount(json['market_value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_item_id'] = productItemId;
    data['product_name'] = productName;
    data['thumbnail'] = thumbnail;
    data['opening_stock'] = openingStock;
    data['current_stock'] = currentStock;
    data['unit_cost'] = unitCost;
    data['market_value'] = marketValue;
    return data;
  }
}
