import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/human_resource/salary_setup/presentation/widgets/add_new_salary_setup_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/human_resource/salary_setup/controller/salary_setup_controller.dart';
import 'package:ecommerce/feature/human_resource/salary_setup/domain/models/salary_setup_model.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';

class SalarySetupItemWidget extends StatelessWidget {
  final SalarySetupItem? salarySetupItem;
  final int index;
  const SalarySetupItemWidget({super.key, this.salarySetupItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:'${salarySetupItem?.firstName??''} ${salarySetupItem?.lastName??''}',)),
      Expanded(child: CustomTextItemWidget(text: salarySetupItem?.salaryTypeName??'')),
      Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, salarySetupItem?.amount ?? 0))),

      ActiveInActiveWidget(active: salarySetupItem?.status == 1, onChanged: (val){
        updateStatus(value: val, id: salarySetupItem!.id!.toString(),
            type: "salary-setup", onSuccess: () async {
              Get.find<SalarySetupController>().getSalarySetupList(1);
            });
      },),

      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "salary_setup", onTap: (){
            Get.back();
            Get.find<SalarySetupController>().deleteSalarySetup(salarySetupItem!.id!);
          },));

      }, onEdit: (){
        Get.dialog(CustomDialogWidget(title: "salary_setup".tr,
            child: AddNewSalarySetupWidget(salarySetupItem: salarySetupItem)));
      },)
    ],
    );
  }
}