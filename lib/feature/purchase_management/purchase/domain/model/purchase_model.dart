import 'package:ecommerce/helper/price_converter.dart';

class PurchaseItem {
  int? id;
  int? userId;
  int? supplierId;
  int? warehouseId;
  String? invoiceNo;
  String? purchaseDate;
  double? subTotal;
  String? discountAmount;
  String? taxAmount;
  String? totalAmount;
  String? paymentStatus;
  String? paymentMethod;
  String? purchaseType;
  String? notes;
  String? createdAt;
  Supplier? supplier;
  Creator? creator;
  List<PurchaseProductItems>? items;

  PurchaseItem(
      {this.id,
        this.userId,
        this.supplierId,
        this.warehouseId,
        this.invoiceNo,
        this.purchaseDate,
        this.subTotal,
        this.discountAmount,
        this.taxAmount,
        this.totalAmount,
        this.paymentStatus,
        this.paymentMethod,
        this.purchaseType,
        this.notes,
        this.createdAt,
        this.supplier,
        this.creator,
        this.items});

  PurchaseItem.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    userId = PriceConverter.parseInt(json['user_id']);
    supplierId = PriceConverter.parseInt(json['supplier_id']);
    warehouseId = PriceConverter.parseInt(json['warehouse_id']);
    invoiceNo = json['invoice_no'];
    purchaseDate = json['purchase_date'];
    subTotal = PriceConverter.parseAmount(json['sub_total']);
    discountAmount = json['discount_amount'];
    taxAmount = json['tax_amount'];
    totalAmount = json['total_amount'];
    paymentStatus = json['payment_status'];
    paymentMethod = json['payment_method'];
    purchaseType = json['purchase_type'];
    notes = json['notes'];
    createdAt = json['created_at'];
    supplier = json['supplier'] != null
        ? Supplier.fromJson(json['supplier'])
        : null;
    creator =
    json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    if (json['items'] != null) {
      items = <PurchaseProductItems>[];
      json['items'].forEach((v) {
        items!.add(PurchaseProductItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['supplier_id'] = supplierId;
    data['warehouse_id'] = warehouseId;
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
    data['created_at'] = createdAt;
    if (supplier != null) {
      data['supplier'] = supplier!.toJson();
    }
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Supplier {
  int? id;
  String? name;
  String? phone;

  Supplier({this.id, this.name, this.phone});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

class Creator {
  int? id;
  String? firstName;

  Creator({this.id, this.firstName});

  Creator.fromJson(Map<String, dynamic> json) {
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

class PurchaseProductItems {
  int? id;
  int? purchaseId;
  int? productItemId;
  int? productVariantId;
  int? quantity;
  double? unitPrice;
  double? totalCost;
  double? taxAmount;
  double? discountAmount;
  String? batchNo;
  String? expiryDate;
  String? receivedQuantity;
  String? wastageQuantity;
  String? returnedQuantity;
  Variant? variant;
  Product? product;

  PurchaseProductItems(
      {this.id,
        this.purchaseId,
        this.productItemId,
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
        this.returnedQuantity,
        this.variant,
        this.product,
        });

  PurchaseProductItems.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    purchaseId = PriceConverter.parseInt(json['purchase_id']);
    productItemId = PriceConverter.parseInt(json['product_item_id']);
    productVariantId = PriceConverter.parseInt(json['product_variant_id']);
    quantity = PriceConverter.parseInt(json['quantity']);
    unitPrice = PriceConverter.parseAmount(json['unit_price']);
    totalCost = PriceConverter.parseAmount(json['total_cost']);
    taxAmount = PriceConverter.parseAmount(json['tax_amount']);
    discountAmount = PriceConverter.parseAmount(json['discount_amount']);
    batchNo = json['batch_no'];
    expiryDate = json['expiry_date'];
    receivedQuantity = json['received_quantity'];
    wastageQuantity = json['wastage_quantity'];
    returnedQuantity = json['returned_quantity'];
    variant = json['variant'] != null ? Variant.fromJson(json['variant']) : null;
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['purchase_id'] = purchaseId;
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
    data['returned_quantity'] = returnedQuantity;
    if (variant != null) {
      data['variant'] = variant!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Variant {
  int? id;
  String? name;

  Variant({this.id, this.name});

  Variant.fromJson(Map<String, dynamic> json) {
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

class Product {
  int? id;
  String? name;
  int? unitId;

  Product({this.id, this.name, this.unitId});

  Product.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    unitId = PriceConverter.parseInt(json['unit_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['unit_id'] = unitId;
    return data;
  }
}
