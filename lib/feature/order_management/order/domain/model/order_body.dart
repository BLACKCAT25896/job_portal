class OrderBody {
  int? orderTypeId;
  int? orderStatusId;
  int? warehouseId;
  String? customerName;
  String? customerPhone;
  String? deliveryAddress;
  String? note;
  String? shippingCost;
  String? orderSource;
  int? paymentMethodId;
  bool? paymentStatus;
  String? discount;
  String? tax;
  String? grandTotal;
  List<OrderItems>? items;

  OrderBody(
      {this.orderTypeId,
        this.orderStatusId,
        this.warehouseId,
        this.customerName,
        this.customerPhone,
        this.deliveryAddress,
        this.note,
        this.shippingCost,
        this.orderSource,
        this.paymentMethodId,
        this.paymentStatus,
        this.discount,
        this.tax,
        this.grandTotal,
        this.items});

  OrderBody.fromJson(Map<String, dynamic> json) {
    orderTypeId = json['order_type_id'];
    orderStatusId = json['order_status_id'];
    warehouseId = json['warehouse_id'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    deliveryAddress = json['delivery_address'];
    note = json['note'];
    shippingCost = json['shipping_cost'];
    orderSource = json['order_source'];
    paymentMethodId = json['payment_method_id'];
    paymentStatus = json['payment_status'];
    discount = json['discount'];
    tax = json['tax'];
    grandTotal = json['grand_total'];
    if (json['items'] != null) {
      items = <OrderItems>[];
      json['items'].forEach((v) {
        items!.add(OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_type_id'] = orderTypeId;
    data['order_status_id'] = orderStatusId;
    data['warehouse_id'] = warehouseId;
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['delivery_address'] = deliveryAddress;
    data['note'] = note;
    data['shipping_cost'] = shippingCost;
    data['order_source'] = orderSource;
    data['payment_method_id'] = paymentMethodId;
    data['payment_status'] = paymentStatus;
    data['discount'] = discount;
    data['tax'] = tax;
    data['grand_total'] = grandTotal;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  int? productItemId;
  int? productVariantId;
  int? quantity;
  double? price;

  OrderItems({this.productItemId, this.productVariantId, this.quantity, this.price});

  OrderItems.fromJson(Map<String, dynamic> json) {
    productItemId = json['product_item_id'];
    productVariantId = json['product_variant_id'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_item_id'] = productItemId;
    data['product_variant_id'] = productVariantId;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}
