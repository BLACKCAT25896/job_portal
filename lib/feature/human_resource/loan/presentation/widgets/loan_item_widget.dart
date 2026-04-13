import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/human_resource/loan/presentation/widgets/add_new_loan_widget.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_popup_menu.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce/feature/human_resource/loan/controller/loan_controller.dart';
import 'package:ecommerce/feature/human_resource/loan/domain/models/loan_model.dart';
import 'package:ecommerce/util/dimensions.dart';

class LoanItemWidget extends StatelessWidget {
  final LoanItem? loanItem;
  final int index;
  const LoanItemWidget({super.key, this.loanItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeSmall, children: [

      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:'${loanItem?.firstName} ${loanItem?.lastName}')),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, loanItem?.amount??0))),
      Expanded(child: CustomTextItemWidget(text:'${loanItem?.installments}')),
      Expanded(child: CustomTextItemWidget(text:'${loanItem?.loanType}')),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, loanItem?.paidAmount??0))),
      Expanded(child: CustomTextItemWidget(text:'${loanItem?.startDate}')),
      Expanded(child: CustomTextItemWidget(text:'${loanItem?.endDate}')),
      CustomTextItemWidget(text:'${loanItem?.status}'),

      CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
      onSelected: (val){
        if(val.title == "edit"){
          Get.dialog(CustomDialogWidget(title: "loan",
              child: AddNewLoanWidget(loanItem: loanItem)));
        }else{
          Get.dialog(ConfirmationDialog(title: "loan",
            onTap: (){
              Get.back();
              Get.find<LoanController>().deleteLoan(int.parse(loanItem!.id!));
            },));
        }
      },),
    ],
    );
  }
}