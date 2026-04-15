

import 'package:mighty_job/helper/price_converter.dart';


class StockReportItem {
  int? id;
  int? productId;
  String? productName;
  int? warehouseId;
  String? warehouseName;
  String? movementType;
  int? quantity;
  int? previousQty;
  int? newQty;
  double? unitCost;
  double? totalCost;
  String? notes;
  String? createdAt;

  StockReportItem(
      {this.id,
        this.productId,
        this.productName,
        this.warehouseId,
        this.warehouseName,
        this.movementType,
        this.quantity,
        this.previousQty,
        this.newQty,
        this.unitCost,
        this.totalCost,
        this.notes,
        this.createdAt});

  StockReportItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    productId = PriceConverter.parseInt(json['product_id']);
    productName = json['product_name'];
    warehouseId = PriceConverter.parseInt(json['warehouse_id']);
    warehouseName = json['warehouse_name'];
    movementType = json['movement_type'];
    quantity = PriceConverter.parseInt(json['quantity']);
    previousQty = PriceConverter.parseInt(json['previous_qty']);
    newQty = PriceConverter.parseInt(json['new_qty']);
    unitCost =PriceConverter.parseAmount( json['unit_cost']);
    totalCost = PriceConverter.parseAmount(json['total_cost']);
    notes = json['notes'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['warehouse_id'] = warehouseId;
    data['warehouse_name'] = warehouseName;
    data['movement_type'] = movementType;
    data['quantity'] = quantity;
    data['previous_qty'] = previousQty;
    data['new_qty'] = newQty;
    data['unit_cost'] = unitCost;
    data['total_cost'] = totalCost;
    data['notes'] = notes;
    data['created_at'] = createdAt;
    return data;
  }
}
