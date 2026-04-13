import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_section.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/inventory/attribute/controller/attribute_controller.dart';
import 'package:ecommerce/feature/inventory/attribute/domain/models/attribute_model.dart';
import 'package:ecommerce/feature/inventory/attribute/presentation/screens/create_new_attribute_screen.dart';
import 'package:ecommerce/feature/inventory/attribute/presentation/widgets/create_new_attribute_widget.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AttributeItemWidget extends StatelessWidget {
  final AttributeItem? attributeItem;
  final int index;
  const AttributeItemWidget({super.key,  required this.index, this.attributeItem});

  @override
  Widget build(BuildContext context) {
    Get.find<ProfileController>();
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: Text(attributeItem?.name??'',
        style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),),


      EditDeletePopupMenu( onEdit:  (){
        Get.dialog(CustomDialogWidget(title: "attribute".tr,
            child: CreateNewAttributeWidget(attributeItem: attributeItem,)));
      } ,
          onDelete:  (){
        Get.dialog(ConfirmationDialog(title: "attribute", content: "attribute", onTap: (){
          Get.back();
          Get.find<AttributeController>().deleteAttribute(attributeItem!.id!);
          },));
          })
    ]):


    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,
        vertical: 5),
      child: CustomContainer(showShadow: false, borderRadius: 5,
          child: Row(children: [

              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(
                child: Text(attributeItem?.name??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
              ),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewAttributeScreen(attributeItem: attributeItem,));
              } ,
                  onDelete: (){

                Get.dialog(ConfirmationDialog(title: "attribute",
                  content: "attribute", onTap: (){
                    Get.back();
                    Get.find<AttributeController>().deleteAttribute(attributeItem!.id!);
                  },));

              })
            ],
          )),
    );
  }
}