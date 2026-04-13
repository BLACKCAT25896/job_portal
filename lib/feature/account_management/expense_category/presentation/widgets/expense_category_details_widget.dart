import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_details_model.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:ecommerce/feature/account_management/expense_category/logic/expense_category_controller.dart';
import 'package:ecommerce/feature/account_management/expense_category/presentation/widgets/category_wise_expense_card_widget.dart';
import 'package:ecommerce/feature/account_management/expense_category/presentation/widgets/expense_category_details_header.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class ExpenseCategoryDetailsWidget extends StatelessWidget {
  final ExpenseCategoryItem? expenseCategoryItem;
  const ExpenseCategoryDetailsWidget({super.key, this.expenseCategoryItem});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExpanseCategoryController>(
      initState: (val) => Get.find<ExpanseCategoryController>().getExpanseCategoryDetails(expenseCategoryItem?.id??0),
        builder: (expenseCategoryController) {
          ExpenseCategoryDetailsModel? expenseCategoryDetailsModel = expenseCategoryController.expenseCategoryDetailsModel;
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: Dimensions.paddingSizeSmall,),
            const ExpenseCategoryDetailsHeaderSection(),

            if(expenseCategoryDetailsModel?.data?.expenses?.length != null)
              Padding(padding: const EdgeInsets.fromLTRB(15, 15, 15,0),
                  child: Text("${"transactions".tr}: ${expenseCategoryDetailsModel?.data?.expenses?.length?? 0}",
                      style: textRegular.copyWith())),
            ListView.builder(
                itemCount: expenseCategoryDetailsModel?.data?.expenses?.length?? 0,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  Expenses? expense = expenseCategoryDetailsModel?.data?.expenses?[index];
                  return  CategoryWiseExpenseWidget(index: index, expenseItem: expense, name: expenseCategoryItem?.name??'');
                })
          ],);
        }
    );
  }
}
