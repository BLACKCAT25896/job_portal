import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_popup_menu.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/domain/model/loyalty_point_redemption_model.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/logic/loyalty_point_redemption_controller.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/presentation/widgets/create_new_loyalty_point_redemption_widget.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';


class LoyaltyPointRedemptionItemWidget extends StatelessWidget {
  final LoyaltyPointRedemptionItem? loyaltyPointRedemptionItem;
  final int index;
  const LoyaltyPointRedemptionItemWidget({super.key, this.loyaltyPointRedemptionItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

        CustomImage(width: 40, height: 40,
            image: '${AppConstants.imageBaseUrl}/loyalty_points/${loyaltyPointRedemptionItem?.image}'),
        Expanded(child: CustomTextItemWidget(text:"${loyaltyPointRedemptionItem?.name}")),
        Expanded(child: CustomTextItemWidget(text:"${loyaltyPointRedemptionItem?.phone}")),
        Expanded(child: CustomTextItemWidget(text:loyaltyPointRedemptionItem?.email??'N/A')),
        Expanded(child: CustomTextItemWidget(text:loyaltyPointRedemptionItem?.address??'N/a')),
        Expanded(child: CustomTextItemWidget(text:loyaltyPointRedemptionItem?.companyName??'N/a')),
        Expanded(child: CustomTextItemWidget(text:loyaltyPointRedemptionItem?.contactPerson??'N/a')),

        ActiveInActiveWidget(active: loyaltyPointRedemptionItem?.status =="1"),


      CustomPopupMenu(menuItems: Get.find<LoyaltyPointRedemptionController>().getPopupMenuList(editDelete: true),
        onSelected: (option) {
          if (option.title == "edit".tr) {
            Get.dialog(Dialog(child: CreateNewLoyaltyPointRedemptionWidget(loyaltyPointRedemptionItem: loyaltyPointRedemptionItem)));
          } else if (option.title == "delete".tr) {
            Get.dialog(ConfirmationDialog(
                title: "loyalty_point".tr,
                onTap: (){
                  Get.back();
                  Get.find<LoyaltyPointRedemptionController>().deleteLoyaltyPointRedemption(int.parse(loyaltyPointRedemptionItem!.id!));
                }));

          }
        },
        child: Icon(Icons.more_vert, color: Theme.of(context).hintColor),
      ),
      ]);
  }
}