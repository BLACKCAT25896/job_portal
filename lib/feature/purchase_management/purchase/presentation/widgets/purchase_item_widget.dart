import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/purchase_management/purchase/domain/model/purchase_model.dart';
import 'package:ecommerce/feature/purchase_management/purchase/logic/purchase_controller.dart';
import 'package:ecommerce/feature/purchase_management/purchase/presentation/widgets/create_new_purchase_widget.dart';
import 'package:ecommerce/feature/purchase_management/purchase/presentation/widgets/purchase_item_dialog.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';


class PurchaseItemWidget extends StatelessWidget {
  final PurchaseItem? purchaseItem;
  final int index;
  const PurchaseItemWidget({super.key, this.purchaseItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:purchaseItem?.invoiceNo??'N/a')),
        Expanded(child: CustomTextItemWidget(text:"${purchaseItem?.supplier?.name}")),
        Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(
            context, purchaseItem?.subTotal??0))),
        Expanded(child: CustomTextItemWidget(text:"${purchaseItem?.purchaseDate}")),
        Expanded(child: CustomTextItemWidget(text:purchaseItem?.paymentMethod??'N/a')),
        Expanded(child: CustomTextItemWidget(text:purchaseItem?.paymentStatus??'N/a')),
        Expanded(child: InkWell(onTap: (purchaseItem?.items != null &&
            purchaseItem!.items!.isNotEmpty)?
            ()=> Get.dialog(PurchaseItemDialog(items: purchaseItem?.items)):null,
            child: CustomTextItemWidget(color: systemPrimaryColor(),
                text:"${purchaseItem?.items?.length??'N/A'} ${'items'.tr}"))),

      EditDeletePopupMenu(onDelete: (){
          Get.dialog(ConfirmationDialog(title: "purchase".tr, onTap: (){
                Get.back();
                Get.find<PurchaseController>().deletePurchase(purchaseItem!.id!);
              }));
        }, onEdit: (){
        Get.dialog(CustomDialogWidget(title: "purchase".tr,width: 1000,
            child: CreateNewPurchaseWidget(purchaseItem: purchaseItem)));
      }),
    ]):
    CustomContainer(borderRadius: 5, showShadow: false,
      child: Column(spacing: Dimensions.paddingSizeSmall, children: [

          Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text:purchaseItem?.invoiceNo??'N/a')),

          ]),
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: CustomTextItemWidget(text:"${"supplier".tr}: "
                "${purchaseItem?.supplier?.name}")),
            Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(
                context, purchaseItem?.subTotal??0))),

          ]),
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: CustomTextItemWidget(text:"${purchaseItem?.purchaseDate}")),
            Expanded(child: CustomTextItemWidget(text:purchaseItem?.paymentMethod??'N/a')),

          ]),
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: CustomTextItemWidget(text:purchaseItem?.paymentStatus??'N/a')),
            Expanded(child: CustomTextItemWidget(text:purchaseItem?.purchaseType??'N/a')),

          ]),
          Row(spacing: Dimensions.paddingSizeDefault, children: [

            Expanded(child: InkWell(onTap: (purchaseItem?.items != null &&
                purchaseItem!.items!.isNotEmpty)?
                ()=> Get.dialog(PurchaseItemDialog(items: purchaseItem?.items)):null,
                child: CustomTextItemWidget(color: systemPrimaryColor(),
                    text:"${purchaseItem?.items?.length??'N/A'} ${'items'.tr}"))),

            EditDeletePopupMenu(onDelete: (){
              Get.dialog(ConfirmationDialog(title: "purchase".tr, onTap: (){
                Get.back();
                Get.find<PurchaseController>().deletePurchase(purchaseItem!.id!);
              }));
            }, onEdit: (){
              Get.dialog(CustomDialogWidget(title: "purchase".tr,
                  child: CreateNewPurchaseWidget(purchaseItem: purchaseItem)));
            }),
          ]),
        ],
      ),
    );
  }
}