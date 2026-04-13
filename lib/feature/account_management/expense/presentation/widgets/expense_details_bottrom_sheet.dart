import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_bottom_sheet.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_row.dart';
import 'package:ecommerce/feature/account_management/expense/domain/model/expense_model.dart';
import 'package:ecommerce/feature/account_management/expense/logic/expense_controller.dart';
import 'package:ecommerce/feature/account_management/expense/presentation/screen/create_new_expense_screen.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

class ExpenseDetailsBottomSheet extends StatelessWidget {
  final ExpenseItem? expenseItem;
  const ExpenseDetailsBottomSheet({super.key, this.expenseItem});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Column(children: [


        Text('transaction_details'.tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge),),
        Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: SizedBox(width: 40, child: Image.asset(Images. edit))),
        Text(PriceConverter.convertPrice(context, expenseItem!.amount??0),
            style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeOverLarge)),
        Text("money_out".tr, style: textRegular.copyWith()),
        const SizedBox(height: Dimensions.paddingSizeDefault),


        CustomRow(title: "account".tr, details: expenseItem?.account?.name??'',),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        if(expenseItem?.transactionDate != null)
        CustomRow(title: "date".tr, details: expenseItem?.transactionDate??''),

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomRow(title: "category".tr, details:expenseItem?.expenseCategory?.name??'')),
        CustomRow(title: "note".tr, details: expenseItem?.note??''),

        const SizedBox(height: Dimensions.paddingSizeOverLarge),

        Row(children: [
          Expanded(child: CustomButton(onTap: (){
            Get.back();
            Get.dialog(ConfirmationDialog(
              title: "expense",
                content: "expense",
                onTap: (){
              Get.find<ExpenseController>().deleteExpense(int.parse(expenseItem!.id!));
              Get.back();

            }));
          },
            buttonColor: Theme.of(context).colorScheme.error,
            fontWeight: FontWeight.w500,
            fontSize: Dimensions.fontSizeDefault,
            text: "delete".tr, icon: const Icon(CupertinoIcons.delete, color: Colors.white, size: 15,),)),

          const SizedBox(width: Dimensions.paddingSizeSmall),
          Expanded(child: CustomButton(onTap: (){
            Get.back();
            Get.to(()=> CreateNewExpenseScreen(expenseItem: expenseItem));
          }, text: "edit_details".tr,
            buttonColor: Colors.transparent,
            showBorderOnly: true, borderColor: Theme.of(context).hintColor,
            textColor: Theme.of(context).textTheme.displayLarge!.color!,
            fontSize: Dimensions.fontSizeDefault,
            icon: SizedBox(height: 20, child: Image.asset(Images.edit)),)),
        ],)


      ],),
    ));
  }
}
