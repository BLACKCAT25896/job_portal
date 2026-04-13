import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/feature/order_management/order_type/domain/model/order_type_model.dart';
import 'package:ecommerce/feature/order_management/order_type/logic/order_type_controller.dart';
import 'package:ecommerce/feature/order_management/order_type/presentation/widgets/create_new_order_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';


class OrderTypeItemWidget extends StatelessWidget {
  final OrderTypeItem? orderTypeItem;
  final int index;
  const OrderTypeItemWidget({super.key, this.orderTypeItem, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:"${orderTypeItem?.name}")),
      ActiveInActiveWidget(active: orderTypeItem?.status == 1),

      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "order_type".tr, onTap: (){
          Get.back();
          Get.find<OrderTypeController>().deleteOrderType(orderTypeItem!.id!);
        }));
      },
      onEdit: (){
        Get.dialog(CustomDialogWidget(title: "order_type".tr,
            child: CreateNewOrderTypeWidget(orderTypeItem: orderTypeItem)));
      }),



    ]):
    CustomContainer(showShadow: false, borderRadius: 5,
      child: Column(spacing: Dimensions.paddingSizeSmall,
        children: [
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text:"${orderTypeItem?.name}")),
          ]),





          Row(spacing: Dimensions.paddingSizeDefault, children: [

            EditDeletePopupMenu(onDelete: (){
              Get.dialog(ConfirmationDialog(title: "order_status".tr, onTap: (){
                Get.back();
                Get.find<OrderTypeController>().deleteOrderType(orderTypeItem!.id!);
              }));
            },
                onEdit: (){
                  Get.dialog(Dialog(child: CreateNewOrderTypeWidget(orderTypeItem: orderTypeItem)));
                }),

          ]),
        ],
      ),
    );
  }
}