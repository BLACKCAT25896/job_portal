import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_section.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/inventory/attribute_value/controller/attribute_value_controller.dart';
import 'package:ecommerce/feature/inventory/attribute_value/domain/models/attribute_value_model.dart';
import 'package:ecommerce/feature/inventory/attribute_value/presentation/screens/create_new_attribute_value_screen.dart';
import 'package:ecommerce/feature/inventory/attribute_value/presentation/widgets/create_new_attribute_value_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AttributeValueItemWidget extends StatelessWidget {
  final AttributeValueItem? attributeValueItem;
  final int index;
  const AttributeValueItemWidget({super.key,  required this.index, this.attributeValueItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text:attributeValueItem?.attributeName??''),),
      Expanded(child: CustomTextItemWidget(text:attributeValueItem?.value??''),),


      EditDeletePopupMenu( onEdit: (){
        Get.dialog(CustomDialogWidget(title: "attribute_value".tr,
            child: CreateNewAttributeValueWidget(attributeValueItem: attributeValueItem,)));
      },
          onDelete: (){

        Get.dialog(ConfirmationDialog(title: "attribute_value", content: "attribute_value", onTap: (){
          Get.back();
          Get.find<AttributeValueController>().deleteAttributeValue(attributeValueItem!.id!);
          },));
          })
    ]):


    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,
        vertical: 5),
      child: CustomContainer(showShadow: false, borderRadius: 5,
          child: Row(children: [

              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Column(
                  children: [
                    Text(attributeValueItem?.attributeName??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                    Text(attributeValueItem?.value??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                  ],
                ),
              ),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewAttributeValueScreen(attributeValueItem: attributeValueItem,));
              },
                  onDelete:  (){

                Get.dialog(ConfirmationDialog(title: "attribute_value", content: "attribute_value", onTap: (){
                    Get.back();
                    Get.find<AttributeValueController>().deleteAttributeValue(attributeValueItem!.id!);
                  },));

              })
            ],
          )),
    );
  }
}