

import 'package:ecommerce/helper/price_converter.dart';

class PurchaseReturnItem {
  int? id;
  String? batchNo;
  String? quantity;
  double? unitCost;
  double? totalCost;
  String? reason;
  String? returnDate;
  ProcessedBy? processedBy;
  int? status;
  String? createdAt;
  Purchase? purchase;
  List<PurchaseItem>? purchaseItem;
  Variant? variant;

  PurchaseReturnItem(
      {this.id,
        this.batchNo,
        this.quantity,
        this.unitCost,
        this.totalCost,
        this.reason,
        this.returnDate,
        this.processedBy,
        this.status,
        this.createdAt,
        this.purchase,
        this.purchaseItem,
        this.variant});

  PurchaseReturnItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    batchNo = json['batch_no'];
    quantity = json['quantity'];
    unitCost = PriceConverter.parseAmount(json['unit_cost']);
    totalCost = PriceConverter.parseAmount(json['total_cost']);
    reason = json['reason'];
    returnDate = json['return_date'];
    processedBy = json['processed_by'] != null
        ? ProcessedBy.fromJson(json['processed_by'])
        : null;
    status = PriceConverter.parseInt(json['status']);
    createdAt = json['created_at'];
    purchase = json['purchase'] != null
        ? Purchase.fromJson(json['purchase'])
        : null;
    if (json['purchase_item'] != null) {
      purchaseItem = <PurchaseItem>[];
      json['purchase_item'].forEach((v) {
        purchaseItem!.add(PurchaseItem.fromJson(v));
      });
    }
    variant =
    json['variant'] != null ? Variant.fromJson(json['variant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['batch_no'] = batchNo;
    data['quantity'] = quantity;
    data['unit_cost'] = unitCost;
    data['total_cost'] = totalCost;
    data['reason'] = reason;
    data['return_date'] = returnDate;
    if (processedBy != null) {
      data['processed_by'] = processedBy!.toJson();
    }
    data['status'] = status;
    data['created_at'] = createdAt;
    if (purchase != null) {
      data['purchase'] = purchase!.toJson();
    }
    if (purchaseItem != null) {
      data['purchase_item'] =
          purchaseItem!.map((v) => v.toJson()).toList();
    }
    if (variant != null) {
      data['variant'] = variant!.toJson();
    }
    return data;
  }
}

class ProcessedBy {
  int? id;
  String? firstName;

  ProcessedBy({this.id, this.firstName});

  ProcessedBy.fromJson(Map<String, dynamic> json) {
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

class Purchase {
  int? id;
  String? invoiceNo;
  String? purchaseDate;
  String? subTotal;
  String? discountAmount;
  String? taxAmount;
  String? totalAmount;
  String? paymentStatus;
  String? paymentMethod;
  String? purchaseType;
  String? notes;

  Purchase(
      {this.id,
        this.invoiceNo,
        this.purchaseDate,
        this.subTotal,
        this.discountAmount,
        this.taxAmount,
        this.totalAmount,
        this.paymentStatus,
        this.paymentMethod,
        this.purchaseType,
        this.notes});

  Purchase.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    invoiceNo = json['invoice_no'];
    purchaseDate = json['purchase_date'];
    subTotal = json['sub_total'];
    discountAmount = json['discount_amount'];
    taxAmount = json['tax_amount'];
    totalAmount = json['total_amount'];
    paymentStatus = json['payment_status'];
    paymentMethod = json['payment_method'];
    purchaseType = json['purchase_type'];
    notes = json['notes'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['invoice_no'] = invoiceNo;
    data['purchase_date'] = purchaseDate;
    data['sub_total'] = subTotal;
    data['discount_amount'] = discountAmount;
    data['tax_amount'] = taxAmount;
    data['total_amount'] = totalAmount;
    data['payment_status'] = paymentStatus;
    data['payment_method'] = paymentMethod;
    data['purchase_type'] = purchaseType;
    data['notes'] = notes;
    return data;
  }
}

class PurchaseItem {
  int? id;
  String? quantity;
  String? unitPrice;
  String? totalCost;
  String? taxAmount;
  String? discountAmount;
  String? batchNo;
  String? expiryDate;
  String? receivedQuantity;
  String? wastageQuantity;
  String? returnedQuantity;

  PurchaseItem(
      {this.id,
        this.quantity,
        this.unitPrice,
        this.totalCost,
        this.taxAmount,
        this.discountAmount,
        this.batchNo,
        this.expiryDate,
        this.receivedQuantity,
        this.wastageQuantity,
        this.returnedQuantity});

  PurchaseItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    totalCost = json['total_cost'];
    taxAmount = json['tax_amount'];
    discountAmount = json['discount_amount'];
    batchNo = json['batch_no'];
    expiryDate = json['expiry_date'];
    receivedQuantity = json['received_quantity'];
    wastageQuantity = json['wastage_quantity'];
    returnedQuantity = json['returned_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['unit_price'] = unitPrice;
    data['total_cost'] = totalCost;
    data['tax_amount'] = taxAmount;
    data['discount_amount'] = discountAmount;
    data['batch_no'] = batchNo;
    data['expiry_date'] = expiryDate;
    data['received_quantity'] = receivedQuantity;
    data['wastage_quantity'] = wastageQuantity;
    data['returned_quantity'] = returnedQuantity;
    return data;
  }
}

class Variant {
  int? id;
  String? name;
  String? sku;
  String? purchasePrice;
  String? price;
  String? offerPrice;
  String? profitMargin;
  double? discount;
  String? stockQuantity;
  int? stockTracking;
  String? image;

  Variant(
      {this.id,
        this.name,
        this.sku,
        this.purchasePrice,
        this.price,
        this.offerPrice,
        this.profitMargin,
        this.discount,
        this.stockQuantity,
        this.stockTracking,
        this.image});

  Variant.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    sku = json['sku'];
    purchasePrice = json['purchase_price'];
    price = json['price'];
    offerPrice = json['offer_price'];
    profitMargin = json['profit_margin'];
    discount = PriceConverter.parseAmount(json['discount']);
    stockQuantity = json['stock_quantity'];
    stockTracking = PriceConverter.parseInt(json['stock_tracking']);
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sku'] = sku;
    data['purchase_price'] = purchasePrice;
    data['price'] = price;
    data['offer_price'] = offerPrice;
    data['profit_margin'] = profitMargin;
    data['discount'] = discount;
    data['stock_quantity'] = stockQuantity;
    data['stock_tracking'] = stockTracking;
    data['image'] = image;
    return data;
  }
}


