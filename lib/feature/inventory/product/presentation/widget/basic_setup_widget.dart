import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_rich_text_editor_widget/custom_richtext_editor_widget.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicSetupWidget extends StatefulWidget {
  const BasicSetupWidget({super.key});

  @override
  State<BasicSetupWidget> createState() => _BasicSetupWidgetState();
}

class _BasicSetupWidgetState extends State<BasicSetupWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productController) {
        return CustomContainer(showShadow: false,borderRadius: 5,
          child: Column(spacing: Dimensions.paddingSizeSmall, children: [
            CustomTextField(title: "name".tr,
                hintText: 'enter_name'.tr,
                controller:productController.nameController ),

            CustomTextField(title: "short_description".tr,
                hintText: 'short_description'.tr,
                minLines: 3, maxLines: 5,
                inputType: TextInputType.multiline,
                inputAction: TextInputAction.newline,
                controller:productController.shortDescriptionController ),

            CustomRichEditor(title: "description".tr,
                controller: productController.descriptionController),

          ]),
        );
      }
    );
  }
}
