import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/pos_management/customer/domain/model/customer_model.dart';
import 'package:ecommerce/feature/pos_management/customer/logic/customer_controller.dart';
import 'package:ecommerce/feature/pos_management/customer/presentation/widgets/create_new_customer_widget.dart';
import 'package:ecommerce/util/dimensions.dart';


class CustomerItemWidget extends StatelessWidget {
  final CustomerItem? customerItem;
  final int index;
  const CustomerItemWidget({super.key, this.customerItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:customerItem?.name??'N/A')),
      Expanded(child: CustomTextItemWidget(text:customerItem?.phone??'N/A')),
      Expanded(child: CustomTextItemWidget(text:customerItem?.address??'N/A')),

      EditDeletePopupMenu(onEdit: (){
          Get.dialog(Dialog(child: CreateNewCustomerWidget(customerItem: customerItem)));
        }, onDelete: (){
        Get.dialog(ConfirmationDialog(title: "customer", onTap: (){
          Get.back();
          Get.find<CustomerController>().deleteCustomer(customerItem!.id!);
        }));}),
      ]);
  }
}