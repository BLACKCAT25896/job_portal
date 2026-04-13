class DamageBody {
  int? warehouseId;
  int? productItemId;
  int? productVariantId;
  int? quantity;
  double? unitCost;
  String? reason;
  String? reportedDate;

  DamageBody(
      {this.warehouseId,
        this.productItemId,
        this.productVariantId,
        this.quantity,
        this.unitCost,
        this.reason,
        this.reportedDate});

  DamageBody.fromJson(Map<String, dynamic> json) {
    warehouseId = json['warehouse_id'];
    productItemId = json['product_item_id'];
    productVariantId = json['product_variant_id'];
    quantity = json['quantity'];
    unitCost = json['unit_cost'];
    reason = json['reason'];
    reportedDate = json['reported_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['warehouse_id'] = warehouseId;
    data['product_item_id'] = productItemId;
    data['product_variant_id'] = productVariantId;
    data['quantity'] = quantity;
    data['unit_cost'] = unitCost;
    data['reason'] = reason;
    data['reported_date'] = reportedDate;
    return data;
  }
}
