

import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/controller/attribute_value_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/models/attribute_value_model.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAttributeValueForVariantWidget extends StatelessWidget {
  final int variantIndex;
  final int attributeIndex;

  const SelectAttributeValueForVariantWidget({
    super.key,
    required this.variantIndex,
    required this.attributeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(initState: (val){
      if (Get.find<AttributeValueController>().attributeValueModel == null) {
        Get.find<AttributeValueController>().getAttributeValueList(1,
            Get.find<AttributeController>().selectedAttributeItem?.id??0);
      }
    },
        builder: (productController) {
      final variant = productController.variants[variantIndex];
      final attribute = variant.attributes?[attributeIndex];

      final valueController =
      Get.find<AttributeValueController>();

      return CustomGenericDropdown<AttributeValueItem>(
        title: "select_value",
        items: valueController.attributeValueModel?.data?.data ?? [],
        selectedValue: attribute?.attributeValueItem,
        onChanged: (val) {
          attribute?.attributeValueId = val?.id;
          attribute?.attributeValueItem = val;
          productController.update();
        },
        getLabel: (item) => item.value ?? '',
      );
    });
  }
}
