import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/feature/account_management/expense_category/logic/expense_category_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectExpenseCategoryWidget extends StatefulWidget {
  const SelectExpenseCategoryWidget({super.key});

  @override
  State<SelectExpenseCategoryWidget> createState() => _SelectExpenseCategoryWidgetState();
}

class _SelectExpenseCategoryWidgetState extends State<SelectExpenseCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: Dimensions.paddingSizeDefault),
      CustomTitle(title: "expense_category", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<ExpanseCategoryController>(initState: (_) {
        if (Get.find<ExpanseCategoryController>().expenseCategoryModel == null) {
          Get.find<ExpanseCategoryController>().getExpanseCategoryList(1);
        }},
        builder: (expanseCategoryController) {
          return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomGenericDropdown(width: Get.width, title: "select".tr,
              items: expanseCategoryController.expenseCategoryModel?.data?.data ?? [],
              selectedValue: expanseCategoryController.selectedExpenseCategoryItem,
              getLabel: (item) => item.name ?? '',
              onChanged: (val) {
                expanseCategoryController.setSelectedExpenseCategoryItem(val!);
              },
            ),
          );
        },
      ),
    ],
    );
  }
}
