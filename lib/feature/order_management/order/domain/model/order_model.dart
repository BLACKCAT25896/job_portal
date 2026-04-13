import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/helper/price_converter.dart';

class OrderModel {
  bool? status;
  String? message;
  List<OrderItem>? data;
  Meta? meta;

  OrderModel({this.status, this.message, this.data, this.meta});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderItem>[];
      json['data'].forEach((v) {
        data!.add(OrderItem.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class OrderItem {
  int? id;
  String? orderNumber;
  String? orderDate;
  int? status;
  String? orderType;
  String? orderStatus;
  int? customerCancelledBy;
  int? orderSplitFrom;
  Customer? customer;
  Payment? payment;
  double? subtotal;
  double? discount;
  String? discountType;
  String? locationType;
  String? note;
  double? tax;
  double? grandTotal;
  double? paidAmount;
  double? dueAmount;
  List<Items>? items;
  String? createdAt;

  OrderItem(
      {this.id,
        this.orderNumber,
        this.orderDate,
        this.status,
        this.orderType,
        this.orderStatus,
        this.customerCancelledBy,
        this.orderSplitFrom,
        this.customer,
        this.payment,
        this.subtotal,
        this.discount,
        this.discountType,
        this.locationType,
        this.note,
        this.tax,
        this.grandTotal,
        this.paidAmount,
        this.dueAmount,
        this.items,
        this.createdAt});

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    orderDate = json['order_date'];
    status = json['status'];
    orderType = json['order_type'];
    orderStatus = json['order_status'];
    customerCancelledBy = json['customer_cancelled_by'];
    orderSplitFrom = json['order_split_from'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    payment =
    json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    subtotal = PriceConverter.parseAmount(json['subtotal']);
    discount = PriceConverter.parseAmount(json['discount']);
    discountType = json['discount_type'];
    locationType = json['location_type'];
    note = json['note'];
    tax = PriceConverter.parseAmount(json['tax']);
    grandTotal = PriceConverter.parseAmount(json['grand_total']);
    paidAmount = PriceConverter.parseAmount(json['paid_amount']);
    dueAmount = PriceConverter.parseAmount(json['due_amount']);
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_number'] = orderNumber;
    data['order_date'] = orderDate;
    data['status'] = status;
    data['order_type'] = orderType;
    data['order_status'] = orderStatus;
    data['customer_cancelled_by'] = customerCancelledBy;
    data['order_split_from'] = orderSplitFrom;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    data['subtotal'] = subtotal;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['location_type'] = locationType;
    data['note'] = note;
    data['tax'] = tax;
    data['grand_total'] = grandTotal;
    data['paid_amount'] = paidAmount;
    data['due_amount'] = dueAmount;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? phone;

  Customer({this.id, this.name, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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

class Payment {
  int? methodId;
  String? methodName;
  bool? status;

  Payment({this.methodId, this.methodName, this.status});

  Payment.fromJson(Map<String, dynamic> json) {
    methodId = json['method_id'];
    methodName = json['method_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['method_id'] = methodId;
    data['method_name'] = methodName;
    data['status'] = status;
    return data;
  }
}

class Items {
  int? id;
  int? quantity;
  int? price;
  int? total;
  Product? product;
  Variant? variant;
  int? status;

  Items(
      {this.id,
        this.quantity,
        this.price,
        this.total,
        this.product,
        this.variant,
        this.status});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    variant =
    json['variant'] != null ? Variant.fromJson(json['variant']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['price'] = price;
    data['total'] = total;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (variant != null) {
      data['variant'] = variant!.toJson();
    }
    data['status'] = status;
    return data;
  }
}


class Variant {
  int? id;
  String? name;
  String? sku;
  String? image;
  int? price;
  List<Attributes>? attributes;

  Variant(
      {this.id, this.name, this.sku, this.image, this.price, this.attributes});

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    image = json['image'];
    price = json['price'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sku'] = sku;
    data['image'] = image;
    data['price'] = price;
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  int? attributeId;
  String? attributeName;
  String? value;

  Attributes({this.attributeId, this.attributeName, this.value});

  Attributes.fromJson(Map<String, dynamic> json) {
    attributeId = json['attribute_id'];
    attributeName = json['attribute_name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attribute_id'] = attributeId;
    data['attribute_name'] = attributeName;
    data['value'] = value;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? total;

  Meta({this.currentPage, this.total,});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['total'] = total;

    return data;
  }
}


