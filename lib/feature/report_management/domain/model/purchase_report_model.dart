

import 'package:ecommerce/feature/purchase_management/supplier/domain/model/supplier_model.dart';
import 'package:ecommerce/helper/price_converter.dart';

class PurchaseReportItem {
  int? id;
  String? supplierId;
  String? invoiceNo;
  String? purchaseDate;
  double? subTotal;
  double? discountAmount;
  double? taxAmount;
  double? totalAmount;
  String? paymentStatus;
  String? paymentMethod;
  String? purchaseType;
  String? createdBy;
  String? notes;
  SupplierItem? supplier;
  List<Items>? items;

  PurchaseReportItem(
      {this.id,
        this.supplierId,
        this.invoiceNo,
        this.purchaseDate,
        this.subTotal,
        this.discountAmount,
        this.taxAmount,
        this.totalAmount,
        this.paymentStatus,
        this.paymentMethod,
        this.purchaseType,
        this.createdBy,
        this.notes,
        this.supplier,
        this.items});

  PurchaseReportItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplierId = json['supplier_id'].toString();
    invoiceNo = json['invoice_no'].toString();
    purchaseDate = json['purchase_date'];
    subTotal = PriceConverter.parseAmount(json['sub_total']);
    discountAmount = PriceConverter.parseAmount(json['discount_amount']);
    taxAmount = PriceConverter.parseAmount(json['tax_amount']);
    totalAmount = PriceConverter.parseAmount(json['total_amount']);
    paymentStatus = json['payment_status'];
    paymentMethod = json['payment_method'];
    purchaseType = json['purchase_type'].toString();
    createdBy = json['created_by'].toString();
    notes = json['notes'];
    supplier = json['supplier'] != null
        ? SupplierItem.fromJson(json['supplier'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['supplier_id'] = supplierId;
    data['invoice_no'] = invoiceNo;
    data['purchase_date'] = purchaseDate;
    data['sub_total'] = subTotal;
    data['discount_amount'] = discountAmount;
    data['tax_amount'] = taxAmount;
    data['total_amount'] = totalAmount;
    data['payment_status'] = paymentStatus;
    data['payment_method'] = paymentMethod;
    data['purchase_type'] = purchaseType;
    data['created_by'] = createdBy;
    data['notes'] = notes;
    if (supplier != null) {
      data['supplier'] = supplier!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Items {
  int? id;
  String? purchaseId;
  String? ingredientId;
  String? quantity;
  double? unitPrice;
  double? totalCost;
  double? taxAmount;
  double? discountAmount;
  String? batchNo;
  String? expiryDate;
  String? receivedQuantity;
  String? wastageQuantity;
  String? returnedQuantity;

  Items(
      {this.id,
        this.purchaseId,
        this.ingredientId,
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
        });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purchaseId = json['purchase_id'].toString();
    ingredientId = json['ingredient_id'].toString();
    quantity = json['quantity'].toString();
    unitPrice = PriceConverter.parseAmount(json['unit_price']);
    totalCost = PriceConverter.parseAmount(json['total_cost']);
    taxAmount = PriceConverter.parseAmount(json['tax_amount']);
    discountAmount = PriceConverter.parseAmount(json['discount_amount']);
    batchNo = json['batch_no'].toString();
    expiryDate = json['expiry_date'];
    receivedQuantity = json['received_quantity'].toString();
    wastageQuantity = json['wastage_quantity'].toString();
    returnedQuantity = json['returned_quantity'].toString();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['purchase_id'] = purchaseId;
    data['ingredient_id'] = ingredientId;
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


