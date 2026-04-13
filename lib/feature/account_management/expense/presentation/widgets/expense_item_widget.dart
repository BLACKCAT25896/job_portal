import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/account_management/expense/domain/model/expense_model.dart';
import 'package:ecommerce/feature/account_management/expense/logic/expense_controller.dart';
import 'package:ecommerce/feature/account_management/expense/presentation/widgets/create_new_expense_widget.dart';
import 'package:ecommerce/feature/account_management/expense/presentation/widgets/expense_details_bottrom_sheet.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';

class ExpenseItemWidget extends StatelessWidget {
  final ExpenseItem? expenseItem;
  final int index;
  const ExpenseItemWidget({super.key, this.expenseItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: expenseItem?.account?.name??'Account')),
      Expanded(child: CustomTextItemWidget(text: expenseItem?.expenseCategory?.name??'Category')),
      Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, expenseItem?.amount??0),)),
      Expanded(child: CustomTextItemWidget(text: expenseItem?.note??'')),
      EditDeletePopupMenu(
        onDelete: (){
          Get.dialog(ConfirmationDialog(title: "expense".tr,
              onTap: (){
            Get.back();
            Get.find<ExpenseController>().deleteExpense(int.parse(expenseItem!.id!));
          }));
        },
        onEdit: ()=> Get.dialog(CustomDialogWidget(title: "expense".tr,
            child: CreateNewExpenseWidget(expenseItem: expenseItem))),)

    ]):
    CustomContainer(borderRadius: 5,
      onTap: () => showModalBottomSheet(backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context, builder: (_)=>  ExpenseDetailsBottomSheet(expenseItem: expenseItem)),
      child: Row(children: [

        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: Dimensions.paddingSizeExtraSmall, children: [
            CustomTextItemWidget(text: expenseItem?.expenseCategory?.name??'N/A'),
            CustomTextItemWidget(text: "${"account".tr}: ${expenseItem?.account?.name??'N/A'}"),
          ])),
        CustomTextItemWidget(text: PriceConverter.convertPrice(context, expenseItem?.amount??0),),
        ],
      ),
    );
  }
}
