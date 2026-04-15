import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/human_resource/loan_installment/presentation/widgets/add_new_loan_installment_widget.dart';
import 'package:mighty_job/helper/price_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_popup_menu.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/dashboard/controller/dashboard_controller.dart';
import 'package:mighty_job/feature/human_resource/loan_installment/controller/loan_installment_controller.dart';
import 'package:mighty_job/feature/human_resource/loan_installment/domain/models/loan_installment_model.dart';
import 'package:mighty_job/util/dimensions.dart';

class LoanInstallmentItemWidget extends StatelessWidget {
  final LoanInstallmentItem? loanInstallmentItem;
  final int index;
  const LoanInstallmentItemWidget({super.key, this.loanInstallmentItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [

      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:'${loanInstallmentItem?.firstName} ${loanInstallmentItem?.lastName??''}')),
      Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, loanInstallmentItem?.amount??0))),
      Expanded(child: CustomTextItemWidget(text: loanInstallmentItem?.dueDate??'')),
      Expanded(child: CustomTextItemWidget(text: loanInstallmentItem?.isPaid??'')),
      Expanded(child: CustomTextItemWidget(text: loanInstallmentItem?.remarks??'')),
      CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
      onSelected: (val){
        if(val.title == "edit".tr){
          Get.dialog(CustomDialogWidget(title: "loan_installment".tr,
              child: AddNewLoanInstallmentWidget(loanInstallmentItem: loanInstallmentItem)));
        }else{
          Get.dialog(ConfirmationDialog(title: "loan_installment",
            onTap: (){
              Get.back();
              Get.find<LoanInstallmentController>().deleteLoanInstallment(int.parse(loanInstallmentItem!.id!));
            },));
        }
      }),
    ],
    );
  }
}