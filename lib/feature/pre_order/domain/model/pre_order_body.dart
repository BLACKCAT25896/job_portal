class PreOrderBody {
  int? productItemId;
  int? productVariantId;
  String? preOrderPrice;
  String? startDate;
  String? endDate;
  String? expectedDeliveryDate;
  int? maxQuantity;
  String? status;

  PreOrderBody(
      {this.productItemId,
        this.productVariantId,
        this.preOrderPrice,
        this.startDate,
        this.endDate,
        this.expectedDeliveryDate,
        this.maxQuantity,
        this.status});

  PreOrderBody.fromJson(Map<String, dynamic> json) {
    productItemId = json['product_item_id'];
    productVariantId = json['product_variant_id'];
    preOrderPrice = json['pre_order_price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    expectedDeliveryDate = json['expected_delivery_date'];
    maxQuantity = json['max_quantity'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_item_id'] = productItemId;
    data['product_variant_id'] = productVariantId;
    data['pre_order_price'] = preOrderPrice;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['expected_delivery_date'] = expectedDeliveryDate;
    data['max_quantity'] = maxQuantity;
    data['status'] = status;
    return data;
  }
}
