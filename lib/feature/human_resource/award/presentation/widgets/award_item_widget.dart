import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_popup_menu.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce/feature/human_resource/award/controller/award_controller.dart';
import 'package:ecommerce/feature/human_resource/award/domain/models/award_model.dart';
import 'package:ecommerce/feature/human_resource/award/presentation/screens/create_new_award_screen.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';

class AwardItemWidget extends StatelessWidget {
  final AwardItem? awardItem;
  final int index;
  const AwardItemWidget({super.key, this.awardItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: '${awardItem?.firstName??''} '
          '${awardItem?.lastName??''}')),
      Expanded(child: CustomTextItemWidget(text: awardItem?.title??'N/A')),
      Expanded(child: CustomTextItemWidget(text: awardItem?.description??'N/A')),
      Expanded(child: CustomTextItemWidget(text: awardItem?.dateAwarded??'N/A')),
      Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, awardItem?.amount??0))),
      Expanded(child: CustomTextItemWidget(text: awardItem?.awardType??'N/A')),
      CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
      onSelected: (value){
        if(value.title == "edit".tr){
          Get.dialog(CustomDialogWidget(title: "award".tr,
              child: CreateNewAwardScreen(awardItem: awardItem)));
        }else if(value.title == "delete".tr){
          Get.dialog(ConfirmationDialog(title: "award",
            onTap: (){
              Get.back();
              Get.find<AwardController>().deleteAward(int.parse(awardItem!.id!));
            },));
        }
      },
      ),
    ],
    ):
    CustomContainer(showShadow: false, borderRadius: 5,
      child: Column(spacing: Dimensions.paddingSizeSmall,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text: '${awardItem?.firstName} ${awardItem?.lastName??''}')),

          ]),

          Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: CustomTextItemWidget(text: awardItem?.title??'N/A')),
            Expanded(child: CustomTextItemWidget(text: awardItem?.dateAwarded??'N/A')),

          ]),

          CustomTextItemWidget(maxLine: 3,
              text: "${"description".tr}: ${awardItem?.description??'N/A'}"),
          Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [

            Expanded(child: CustomTextItemWidget(text: awardItem?.dateAwarded??'N/A')),
            Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, awardItem?.amount??0))),
            Expanded(child: CustomTextItemWidget(text: awardItem?.awardType??'N/A')),
            CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
                onSelected: (value){
                  if(value.title == "edit".tr){
                    Get.dialog(CustomDialogWidget(title: "award".tr,
                        child: CreateNewAwardScreen(awardItem: awardItem)));
                  }else if(value.title == "delete".tr){
                    Get.dialog(ConfirmationDialog(title: "award",
                      onTap: (){
                        Get.back();
                        Get.find<AwardController>().deleteAward(int.parse(awardItem!.id!));
                      },));
                  }
                }),
          ]),
        ],
      ),
    );
  }
}