import 'package:ecommerce/feature/inventory/attribute/domain/models/attribute_model.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/models/attribute_value_model.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/domain/model/unit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class VariantBody{
  TextEditingController nameController;
  UnitItem? unitItem;
  TextEditingController priceController;
  TextEditingController? offerPriceController;
  TextEditingController? discountController;
  TextEditingController stockController;
  TextEditingController weightController;
  XFile? image;
  String? imageUrl;
  TextEditingController stockAlertController;
  bool? isDefault;
  List<VariantAttribute>? attributes;

  VariantBody(
      { required this.nameController,
        this.unitItem,
        required this.priceController,
        this.offerPriceController,
        this.discountController,
        required this.stockController,
        required this.weightController,
        this.image,
        this.imageUrl,
        required this.stockAlertController,
        this.isDefault,
        this.attributes});
}

class VariantAttribute {
  int? attributeId;
  int? attributeValueId;
  AttributeItem? attributeItem;
  AttributeValueItem? attributeValueItem;

  VariantAttribute({
    this.attributeId,
    this.attributeValueId,
    this.attributeItem,
    this.attributeValueItem,
  });

  Map<String, dynamic> toJson() => {
    "attribute_id": attributeId,
    "attribute_value_id": attributeValueId,
  };
}
