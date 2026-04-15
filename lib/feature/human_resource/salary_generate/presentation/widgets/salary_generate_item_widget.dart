import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/presentation/widgets/add_new_salary_generate_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/controller/salary_generate_controller.dart';
import 'package:mighty_job/feature/human_resource/salary_generate/domain/models/salary_generate_model.dart';
import 'package:mighty_job/helper/price_converter.dart';
import 'package:mighty_job/util/dimensions.dart';

class SalaryGenerateItemWidget extends StatelessWidget {
  final SalaryGenerateItem? salaryGenerateItem;
  final int index;
  const SalaryGenerateItemWidget({super.key, this.salaryGenerateItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:'${salaryGenerateItem?.firstName}')),
      Expanded(child: CustomTextItemWidget(text:'${salaryGenerateItem?.month}')),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, salaryGenerateItem?.basicSalary??0))),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, salaryGenerateItem?.totalEarnings??0))),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, salaryGenerateItem?.totalDeductions??0))),
      Expanded(child: CustomTextItemWidget(text:'${salaryGenerateItem?.overtimeHours}')),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, salaryGenerateItem?.overtimeAmount??0))),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, salaryGenerateItem?.netSalary??0))),
      EditDeletePopupMenu(onDelete: (){
        Get.dialog(ConfirmationDialog(title: "salary_generate",
          onTap: (){
            Get.back();
            Get.find<SalaryGenerateController>().deleteSalaryGenerate(salaryGenerateItem!.id!);
          },));

      }, onEdit: (){
        Get.dialog(CustomDialogWidget(title: "salary_generate".tr,
            child: AddNewSalaryGenerateWidget(salaryGenerateItem: salaryGenerateItem)));
      },)
    ],
    );
  }
}