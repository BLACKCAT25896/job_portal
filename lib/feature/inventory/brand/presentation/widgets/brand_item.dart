import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_section.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/inventory/brand/controller/brand_controller.dart';
import 'package:ecommerce/feature/inventory/brand/domain/models/brand_model.dart';
import 'package:ecommerce/feature/inventory/brand/presentation/screens/create_new_brand_screen.dart';
import 'package:ecommerce/feature/inventory/brand/presentation/widgets/create_new_brand_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BrandItemWidget extends StatelessWidget {
  final BrandItem? brandItem;
  final int index;
  const BrandItemWidget({super.key,  required this.index, this.brandItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      CustomImage(image: "${AppConstants.imageBaseUrl}/brands/${brandItem?.imageUrl}",
        width: Dimensions.imageSize, height: Dimensions.imageSize,radius: 5),
      Expanded(child: CustomTextItemWidget(text:brandItem?.name??''),),
      Expanded(child: CustomTextItemWidget(text:brandItem?.description??'')),


      EditDeletePopupMenu( onEdit: (){
        Get.dialog( CustomDialogWidget(child: CreateNewBrandWidget(brandItem: brandItem,)));
      },
          onDelete:(){

        Get.dialog(ConfirmationDialog(title: "brand", onTap: (){
          Get.back();
          Get.find<BrandController>().deleteBrand(brandItem!.id!);
          },));
          })
    ]):


    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,
        vertical: 5),
      child: CustomContainer(showShadow: false, borderRadius: 5,
          child: Row(children: [
            ClipRRect(borderRadius: BorderRadius.circular(5),
                child: CustomImage(image: brandItem?.imageUrl, width: Dimensions.imageSize,
                  height: Dimensions.imageSize,)),

              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(
                child: Text(brandItem?.name??'', style: textRegular.copyWith(
                    fontSize: Dimensions.fontSizeLarge),),
              ),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewBrandScreen(brandItem: brandItem,));
              }, onDelete:  (){

                Get.dialog(ConfirmationDialog(title: "brand",  onTap: (){
                    Get.back();
                    Get.find<BrandController>().deleteBrand(brandItem!.id!);
                  },));

              })
            ],
          )),
    );
  }
}