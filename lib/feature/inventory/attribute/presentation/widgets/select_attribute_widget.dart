import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/models/attribute_model.dart';
import 'package:ecommerce/util/dimensions.dart';

class SelectAttributeWidget extends StatefulWidget {
  final String? title;
  const SelectAttributeWidget({super.key, this.title});

  @override
  State<SelectAttributeWidget> createState() => _SelectAttributeWidgetState();
}

class _SelectAttributeWidgetState extends State<SelectAttributeWidget> {
  @override
  void initState() {
    super.initState();
    if (Get.find<AttributeController>().attributeModel == null) {
      Get.find<AttributeController>().getAttributeList(1);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [



      if(widget.title != "empty")
      Padding(padding: const EdgeInsets.only(top:  Dimensions.paddingSizeDefault),
        child: Text(widget.title?? "attribute".tr, style: textRegular.copyWith(
            fontSize: Dimensions.fontSizeLarge))),

      GetBuilder<AttributeController>(builder: (attributeController) {
        return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomGenericDropdown<AttributeItem>(
            title: "select_attribute",
            items: attributeController.attributeModel?.data?.data ?? [],
            selectedValue: attributeController.selectedAttributeItem,
            onChanged: (val) {
              attributeController.selectAttribute(val!);
              },
            getLabel: (item) => item.name ?? ''));
          },
        ),
      ],
    );
  }
}
