import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute/presentation/widgets/select_atribute_for_variant_widget.dart';
import 'package:ecommerce/feature/inventory/attribute_value/controller/attribute_value_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/presentation/widgets/select_atribute_value_for_variant_widget.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttributeSelectionWidget extends StatelessWidget {
  final int variantIndex;
  const AttributeSelectionWidget({super.key, required this.variantIndex});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productController) {
      final variant = productController.variants[variantIndex];
      return GetBuilder<AttributeController>(
        builder: (attributeController) {
          return GetBuilder<AttributeValueController>(
            builder: (valueController) {
              return Column(crossAxisAlignment: CrossAxisAlignment.end,
                spacing: Dimensions.paddingSizeDefault, children: [
                  Row(
                    children: [
                      Text("attribute".tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
                    ],
                  ),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: variant.attributes?.length??0,
                  itemBuilder: (context, attrIndex) {
                    return Row(spacing: Dimensions.paddingSizeSmall, children: [

                      Expanded(child: SelectAttributeForVariantWidget(
                        variantIndex: variantIndex,
                        attributeIndex: attrIndex)),

                      Expanded(child: SelectAttributeValueForVariantWidget(
                          variantIndex: variantIndex,
                          attributeIndex: attrIndex)),

                      CustomContainer(color: systemPrimaryColor(),
                        onTap: ()=> productController.removeAttributeFromVariant(variantIndex, attrIndex),
                        showShadow: false, borderRadius: 5,
                        child : Image.asset(Images.delete, width: 20, color: Colors.red),
                      ),
                    ]);
                    }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: Dimensions.paddingSizeSmall);
                },),

                IntrinsicWidth(child: CustomButton(onTap: () {
                  productController.addAttributeToVariant(variantIndex);
                  }, text:"add_attribute".tr)),
                  ],
                );
            }
          );
        }
      );
      },
    );
  }
}
