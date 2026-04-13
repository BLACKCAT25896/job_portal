class PurchaseBody {
  int? supplierId;
  int? warehouseId;
  String? purchaseDate;
  double? subTotal;
  double? discountAmount;
  double? taxAmount;
  double? totalAmount;
  String? paymentStatus;
  String? paymentMethod;
  int? createdBy;
  String? notes;
  List<PurchaseItems>? items;

  PurchaseBody(
      {this.supplierId,
        this.warehouseId,
        this.purchaseDate,
        this.subTotal,
        this.discountAmount,
        this.taxAmount,
        this.totalAmount,
        this.paymentStatus,
        this.paymentMethod,
        this.createdBy,
        this.notes,
        this.items});

  PurchaseBody.fromJson(Map<String, dynamic> json) {
    supplierId = json['supplier_id'];
    warehouseId = json['warehouse_id'];
    purchaseDate = json['purchase_date'];
    subTotal = json['sub_total'];
    discountAmount = json['discount_amount'];
    taxAmount = json['tax_amount'];
    totalAmount = json['total_amount'];
    paymentStatus = json['payment_status'];
    paymentMethod = json['payment_method'];
    createdBy = json['created_by'];
    notes = json['notes'];
    if (json['items'] != null) {
      items = <PurchaseItems>[];
      json['items'].forEach((v) {
        items!.add(PurchaseItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['supplier_id'] = supplierId;
    data['warehouse_id'] = warehouseId;
    data['purchase_date'] = purchaseDate;
    data['sub_total'] = subTotal;
    data['discount_amount'] = discountAmount;
    data['tax_amount'] = taxAmount;
    data['total_amount'] = totalAmount;
    data['payment_status'] = paymentStatus;
    data['payment_method'] = paymentMethod;
    data['created_by'] = createdBy;
    data['notes'] = notes;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PurchaseItems {
  int? productItemId;
  int? productVariantId;
  int? quantity;
  double? unitPrice;
  double? totalCost;
  double? taxAmount;
  double? discountAmount;
  String? batchNo;
  String? expiryDate;
  int? receivedQuantity;
  int? wastageQuantity;
  List<Serials>? serials;

  PurchaseItems(
      {this.productItemId,
        this.productVariantId,
        this.quantity,
        this.unitPrice,
        this.totalCost,
        this.taxAmount,
        this.discountAmount,
        this.batchNo,
        this.expiryDate,
        this.receivedQuantity,
        this.wastageQuantity,
        this.serials});

  PurchaseItems.fromJson(Map<String, dynamic> json) {
    productItemId = json['product_item_id'];
    productVariantId = json['product_variant_id'];
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    totalCost = json['total_cost'];
    taxAmount = json['tax_amount'];
    discountAmount = json['discount_amount'];
    batchNo = json['batch_no'];
    expiryDate = json['expiry_date'];
    receivedQuantity = json['received_quantity'];
    wastageQuantity = json['wastage_quantity'];
    if (json['serials'] != null) {
      serials = <Serials>[];
      json['serials'].forEach((v) {
        serials!.add(Serials.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_item_id'] = productItemId;
    data['product_variant_id'] = productVariantId;
    data['quantity'] = quantity;
    data['unit_price'] = unitPrice;
    data['total_cost'] = totalCost;
    data['tax_amount'] = taxAmount;
    data['discount_amount'] = discountAmount;
    data['batch_no'] = batchNo;
    data['expiry_date'] = expiryDate;
    data['received_quantity'] = receivedQuantity;
    data['wastage_quantity'] = wastageQuantity;
    if (serials != null) {
      data['serials'] = serials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Serials {
  String? serialNumber;
  String? warrantyExpiry;

  Serials({this.serialNumber, this.warrantyExpiry});

  Serials.fromJson(Map<String, dynamic> json) {
    serialNumber = json['serial_number'];
    warrantyExpiry = json['warranty_expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serial_number'] = serialNumber;
    data['warranty_expiry'] = warrantyExpiry;
    return data;
  }
}
