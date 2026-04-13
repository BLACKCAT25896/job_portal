import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/controller/attribute_value_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/models/attribute_value_model.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';
import 'package:ecommerce/util/dimensions.dart';

class SelectAttributeValueWidget extends StatefulWidget {
  final String? title;
  const SelectAttributeValueWidget({super.key, this.title});

  @override
  State<SelectAttributeValueWidget> createState() => _SelectAttributeValueWidgetState();
}

class _SelectAttributeValueWidgetState extends State<SelectAttributeValueWidget> {
  @override
  void initState() {
    super.initState();
    if (Get.find<AttributeValueController>().attributeValueModel == null) {
      Get.find<AttributeValueController>().getAttributeValueList(1,
          Get.find<AttributeController>().selectedAttributeItem?.id??0);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: Dimensions.paddingSizeDefault),
      Text(widget.title?? "attribute_value".tr, style: textRegular.copyWith(
          fontSize: Dimensions.fontSizeLarge),),
      GetBuilder<AttributeValueController>(builder: (attributeValueController) {
        return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomGenericDropdown<AttributeValueItem>(
            title: "select_attribute",
            items: attributeValueController.attributeValueModel?.data?.data ?? [],
            selectedValue: attributeValueController.selectedAttributeValueItem,
            onChanged: (val) {
              attributeValueController.selectAttributeValue(val!);
              },
            getLabel: (item) => item.value ?? ''));
          },
        ),
      ],
    );
  }
}
