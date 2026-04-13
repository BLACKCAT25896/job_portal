import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_bottom_sheet.dart';
import 'package:ecommerce/common/widget/edit_delete_bottom_section.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:ecommerce/feature/account_management/expense_category/logic/expense_category_controller.dart';
import 'package:ecommerce/feature/account_management/expense_category/presentation/screen/create_new_expense_category_screen.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/util/dimensions.dart';


class ExpenseCategoryEditDeleteWidget extends StatelessWidget {
  final ExpenseCategoryItem? expenseCategoryItem;
  const ExpenseCategoryEditDeleteWidget({super.key, this.expenseCategoryItem});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal : Dimensions.paddingSizeDefault),
      child: EditDeleteBottomSection(edit: (Get.find<ProfileController>().hasPermission("expense-category-update") && expenseCategoryItem?.id != null)? (){
        Get.back();
        Get.to(()=> CreateNewExpenseCategoryScreen(depositCategoryItem: expenseCategoryItem,));
      } : null,
          delete: (Get.find<ProfileController>().hasPermission("expense-category-delete") && expenseCategoryItem?.id != null)? (){
            Get.back();
            Get.find<ExpanseCategoryController>().deleteExpanseCategory(expenseCategoryItem!.id!);
          }: null),
    ));
  }
}
