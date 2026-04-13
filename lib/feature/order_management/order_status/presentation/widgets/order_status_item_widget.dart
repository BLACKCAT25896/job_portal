import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/feature/order_management/order_status/domain/model/order_status_model.dart';
import 'package:ecommerce/feature/order_management/order_status/logic/order_status_controller.dart';
import 'package:ecommerce/feature/order_management/order_status/presentation/widgets/create_new_order_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';


class OrderStatusItemWidget extends StatelessWidget {
  final OrderStatusItem? orderStatusItem;
  final int index;
  const OrderStatusItemWidget({super.key, this.orderStatusItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:"${orderStatusItem?.name}")),
      ActiveInActiveWidget(active: orderStatusItem?.status == 1),

      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "order_status".tr, onTap: (){
          Get.back();
          Get.find<OrderStatusController>().deleteOrderStatus(orderStatusItem!.id!);
        }));
      },
      onEdit: (){
        Get.dialog(CustomDialogWidget(child: CreateNewOrderStatusWidget(orderStatusItem: orderStatusItem)));
      }),



    ]):
    CustomContainer(showShadow: false, borderRadius: 5,
      child: Column(spacing: Dimensions.paddingSizeSmall,
        children: [
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text:"${orderStatusItem?.name}")),
          ]),

          Row(spacing: Dimensions.paddingSizeDefault, children: [

            EditDeletePopupMenu(onDelete: (){
              Get.dialog(ConfirmationDialog(title: "order_status".tr, onTap: (){
                Get.back();
                Get.find<OrderStatusController>().deleteOrderStatus(orderStatusItem!.id!);
              }));
            },
                onEdit: (){
                  Get.dialog(Dialog(child: CreateNewOrderStatusWidget(orderStatusItem: orderStatusItem)));
                }),

          ]),
        ],
      ),
    );
  }
}