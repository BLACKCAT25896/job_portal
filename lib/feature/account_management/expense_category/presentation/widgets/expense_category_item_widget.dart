import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:ecommerce/feature/account_management/expense_category/logic/expense_category_controller.dart';
import 'package:ecommerce/feature/account_management/expense_category/presentation/widgets/create_new_expense_category_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class ExpanseCategoryItemWidget extends StatelessWidget {
  final ExpenseCategoryItem? expenseCategoryItem;
  final int index;
  const ExpanseCategoryItemWidget({super.key, this.expenseCategoryItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),
      Expanded(child: Text(expenseCategoryItem?.name??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall))),

      EditDeletePopupMenu(onEdit: () {
        Get.dialog(CustomDialogWidget(title: "expense_category".tr,
            child: CreateNewExpenseCategoryWidget(depositCategoryItem: expenseCategoryItem)));
      },
        onDelete: () {
          Get.dialog(ConfirmationDialog(title: "expense_category",
              onTap: () {
                Get.back();
                Get.find<ExpanseCategoryController>().deleteExpanseCategory(expenseCategoryItem!.id!);
              },
          ));
        },
      )

    ]);
  }
}
