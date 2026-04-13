import 'package:ecommerce/helper/price_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/domain/model/returns_model.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/logic/purchase_returns_controller.dart';
import 'package:ecommerce/feature/purchase_management/purchase_return/presentation/widgets/create_new_returns_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';


class PurchaseReturnItemWidget extends StatelessWidget {
  final PurchaseReturnItem? purchaseReturnItem;
  final int index;
  const PurchaseReturnItemWidget({super.key, this.purchaseReturnItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool iDesktop = ResponsiveHelper.isDesktop(context);
    return iDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:"${purchaseReturnItem?.batchNo}")),
        Expanded(child: CustomTextItemWidget(text:"${purchaseReturnItem?.purchase?.purchaseDate}")),
        Expanded(child: CustomTextItemWidget(text:"${purchaseReturnItem?.quantity}")),
        Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, purchaseReturnItem?.unitCost??0))),
        Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, purchaseReturnItem?.totalCost??0))),
        Expanded(child: CustomTextItemWidget(text:"${purchaseReturnItem?.reason}")),

      EditDeletePopupMenu(onEdit: (){
          Get.dialog(Dialog(child: CreateNewPurchaseReturnWidget(purchaseReturnItem: purchaseReturnItem)));
        },onDelete: (){
        Get.dialog(ConfirmationDialog(title: "purchase".tr, onTap: (){
          Get.back();
          Get.find<PurchaseReturnController>().deletePurchaseReturn(purchaseReturnItem!.id!);
        }));
      }),
      ]):

    CustomContainer(showShadow: false, borderRadius: 5,
        child: Column(spacing: Dimensions.paddingSizeSmall, children: [
            Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
           Expanded(child: CustomTextItemWidget(text:"${purchaseReturnItem?.batchNo}")),
            ]),

          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: CustomTextItemWidget(text:"${"date".tr}: ${purchaseReturnItem?.purchase?.purchaseDate}")),
            Expanded(child: CustomTextItemWidget(text:"${"qty".tr}: ${purchaseReturnItem?.quantity}")),
          ]),

          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: CustomTextItemWidget(text:"${"unit_cost".tr}: "
                "${PriceConverter.convertPrice(context, purchaseReturnItem?.unitCost??0)}")),
            Expanded(child: CustomTextItemWidget(text: ""
                "${"total_cost".tr}: ${PriceConverter.convertPrice(context, purchaseReturnItem?.totalCost??0)}")),

          ]),

          Row(spacing: Dimensions.paddingSizeDefault, children: [

            EditDeletePopupMenu(onEdit: (){
              Get.dialog(Dialog(child: CreateNewPurchaseReturnWidget(purchaseReturnItem: purchaseReturnItem)));
            },onDelete: (){
              Get.dialog(ConfirmationDialog(title: "purchase".tr, onTap: (){
                Get.back();
                Get.find<PurchaseReturnController>().deletePurchaseReturn(purchaseReturnItem!.id!);
              }));
            }),
          ]),
          ],
        ),
      );
  }
}