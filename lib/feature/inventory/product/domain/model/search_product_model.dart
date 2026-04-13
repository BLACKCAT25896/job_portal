import 'package:ecommerce/helper/price_converter.dart';
import 'package:flutter/cupertino.dart';

class SearchedProductModel {
  bool? success;
  List<Products>? products;

  SearchedProductModel({this.success, this.products});

  SearchedProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? code;
  String? name;
  double? cost;
  double? price;
  double? taxNet;
  int? unitId;
  int? stockQuantity;
  Unit? unit;
  int? quantity;
  bool? isAdd;
  TextEditingController? amountController;
  FocusNode? focusNode;

  Products(
      {this.id,
        this.code,
        this.name,
        this.cost,
        this.price,
        this.taxNet,
        this.unitId,
        this.stockQuantity,
        this.unit,
        this.quantity,
        this.isAdd,
        this.amountController,
        this.focusNode
      });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    cost = double.parse(json['cost'].toString());
    price = double.parse(json['price'].toString());
    taxNet = PriceConverter.parseAmount(json['tax_net']);
    stockQuantity =  PriceConverter.parseInt(json['stock_quantity']);
    if(json['unit_id'] != null){
      try {
        unitId = json['unit_id'];
      }catch(e){
        unitId = int.parse(json['unit_id'].toString());
      }
    }
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    quantity = 1;
    isAdd = true;
    amountController = TextEditingController(text: double.parse(json['price'].toString()).toStringAsFixed(2));
    focusNode = FocusNode();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['cost'] = cost;
    data['price'] = price;
    data['tax_net'] = taxNet;
    data['unit_id'] = unitId;
    data['stock_quantity'] = stockQuantity;
    if (unit != null) {
      data['unit'] = unit!.toJson();
    }
    data['quantity'] = quantity;
    data['isAdd'] = isAdd;
    data['amount'] = amountController!.text;

    return data;
  }
}



class Unit {
  int? id;
  String? name;
  String? shortName;

  Unit({this.id, this.name, this.shortName});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['short_name'] = shortName;
    return data;
  }
}
