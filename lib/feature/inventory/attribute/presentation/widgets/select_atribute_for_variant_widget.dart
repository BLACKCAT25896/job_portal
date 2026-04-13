

import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/models/attribute_model.dart';
import 'package:ecommerce/feature/inventory/attribute_value/controller/attribute_value_controller.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAttributeForVariantWidget extends StatelessWidget {
  final int variantIndex;
  final int attributeIndex;

  const SelectAttributeForVariantWidget({
    super.key,
    required this.variantIndex,
    required this.attributeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(initState: (val){
      if(Get.find<AttributeController>().attributeModel == null){
        Get.find<AttributeController>().getAttributeList(1);
      }
    },
        builder: (productController) {
      final variant = productController.variants[variantIndex];
      final attribute =
      variant.attributes?[attributeIndex];

      final attributeController = Get.find<AttributeController>();

      return CustomGenericDropdown<AttributeItem>(
        title: "select_attribute",
        items: attributeController.attributeModel?.data?.data ?? [],
        selectedValue: attribute?.attributeItem,
        onChanged: (val) {
          attribute?.attributeItem = val;
          attribute?.attributeId = val?.id;
          attribute?.attributeValueId = null;
          productController.update();
          Get.find<AttributeValueController>().getAttributeValueList(1, val!.id!);
        },
        getLabel: (item) => item.name ?? '',
      );
    });
  }
}
