import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/custom_item_text_widget.dart';
import 'package:ecommerce/feature/human_resource/salary_type/presentation/widgets/add_new_salary_type_widget.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/human_resource/salary_type/controller/salary_type_controller.dart';
import 'package:ecommerce/feature/human_resource/salary_type/domain/models/salary_type_model.dart';
import 'package:ecommerce/util/dimensions.dart';

class SalaryTypeItemWidget extends StatelessWidget {
  final SalaryTypeItem? salaryTypeItem;
  final int index;
  const SalaryTypeItemWidget({super.key, this.salaryTypeItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomItemTextWidget(text: '${salaryTypeItem?.name}')),
      Expanded(child: CustomItemTextWidget(text: '${salaryTypeItem?.type}')),
      Expanded(child: CustomItemTextWidget(text: PriceConverter.convertPrice(context, salaryTypeItem?.defaultAmount??0))),
      Expanded(child: CustomItemTextWidget(text: salaryTypeItem?.isVisibleInPayslip == "1"? "yes".tr:"no".tr)),
      Expanded(child: CustomItemTextWidget(text: salaryTypeItem?.isTaxable == "1"? "yes".tr : "no".tr)),
      ActiveInActiveWidget(active: salaryTypeItem?.status == "1", onChanged: (val) {
        updateStatus(value: val, id: salaryTypeItem!.id!,
          type: "salary-type", onSuccess: () async {
          Get.find<SalaryTypeController>().getSalaryTypeList(1);
          });
        }),

        EditDeletePopupMenu(onEdit: () {
            Get.dialog(CustomDialogWidget(title: "salary_type".tr,
                child: AddNewSalaryTypeWidget(salaryTypeItem: salaryTypeItem)));
          },
          onDelete: () {
          Get.dialog(
            ConfirmationDialog(title: "salary_type", onTap: () {
              Get.back();
              Get.find<SalaryTypeController>().deleteSalaryType(int.parse(salaryTypeItem!.id!));
              }),
            );
          },
        ),
      ],
    );
  }
}
