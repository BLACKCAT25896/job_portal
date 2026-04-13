import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/order_management/order/domain/model/order_model.dart';
import 'package:ecommerce/feature/order_management/order/logic/order_controller.dart';
import 'package:ecommerce/feature/order_management/order/presentation/widgets/create_new_order_widget.dart';
import 'package:ecommerce/helper/date_converter.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';


class OrderItemWidget extends StatelessWidget {
  final OrderItem? orderItem;
  final int index;
  const OrderItemWidget({super.key, this.orderItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:"${orderItem?.orderNumber}")),
      Expanded(child: CustomTextItemWidget(text:"${orderItem?.customer?.name}")),
      Expanded(child: CustomTextItemWidget(text:"${orderItem?.orderType?.capitalizeFirst?.replaceAll("_", " ")}",)),
      Expanded(child: CustomTextItemWidget(text:DateConverter.quotationDateAndTime(DateTime.parse(orderItem?.createdAt??'')))),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, orderItem?.grandTotal ?? 0))),
      Expanded(child: CustomTextItemWidget(text:"${orderItem?.orderStatus}")),

      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "order".tr, onTap: (){
          Get.back();
          Get.find<OrderController>().deleteOrder(orderItem!.id!);
        }));
      },
      onEdit: (){
        Get.dialog(Dialog(child: CreateNewOrderWidget(orderItem: orderItem)));
      }),



    ]):
    CustomContainer(showShadow: false, borderRadius: 5,
      child: Column(spacing: Dimensions.paddingSizeSmall, children: [
        Row(spacing: Dimensions.paddingSizeDefault, children: [
          NumberingWidget(index: index),
          Expanded(child: CustomTextItemWidget(text:"${orderItem?.orderNumber}")),
        ]),


        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: CustomTextItemWidget(text:"${"customer".tr}: ${orderItem?.customer?.name}")),
          Expanded(child: CustomTextItemWidget(text:"${orderItem?.orderType?.capitalizeFirst?.replaceAll("_", " ")}",)),
          ]),

        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: CustomTextItemWidget(text:DateConverter.quotationDateAndTime(DateTime.parse(orderItem?.createdAt??'')))),
          Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, orderItem?.grandTotal ?? 0))),
        ]),

        Row(spacing: Dimensions.paddingSizeDefault, children: [

          EditDeletePopupMenu(onDelete: (){
            Get.dialog(ConfirmationDialog(title: "order".tr, onTap: (){
              Get.back();
              Get.find<OrderController>().deleteOrder(orderItem!.id!);
            }));
            },
              onEdit: (){
            Get.dialog(Dialog(child: CreateNewOrderWidget(orderItem: orderItem)));
          }),
          ]),
        ],
      ),
    );
  }
}