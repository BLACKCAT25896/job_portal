import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/controller/date_picker_controller.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/date_selection_widget.dart';
import 'package:mighty_job/feature/account_management/accounting/logic/account_controller.dart';
import 'package:mighty_job/feature/account_management/accounting/presentation/widgets/account_selection_widget.dart';
import 'package:mighty_job/feature/account_management/expense/domain/model/expense_body.dart';
import 'package:mighty_job/feature/account_management/expense/domain/model/expense_model.dart';
import 'package:mighty_job/feature/account_management/expense/logic/expense_controller.dart';
import 'package:mighty_job/feature/account_management/expense_category/logic/expense_category_controller.dart';
import 'package:mighty_job/feature/account_management/expense_category/presentation/widgets/select_expense_category_widget.dart';
import 'package:mighty_job/feature/account_management/fund/logic/fund_controller.dart';
import 'package:mighty_job/feature/account_management/fund/presentation/widgets/select_fund_widget.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';

class CreateNewExpenseWidget extends StatefulWidget {
  final ExpenseItem? expenseItem;
  const CreateNewExpenseWidget({super.key, this.expenseItem});

  @override
  State<CreateNewExpenseWidget> createState() => _CreateNewExpenseWidgetState();
}

class _CreateNewExpenseWidgetState extends State<CreateNewExpenseWidget> {
  TextEditingController amountController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController voucherController = TextEditingController();
  TextEditingController receivedFromController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.expenseItem != null){
      update = true;
      amountController.text = widget.expenseItem?.amount.toString()?? '';
      detailsController.text = widget.expenseItem?.note?? '';
      voucherController.text = widget.expenseItem?.voucherNo??"";
      receivedFromController.text = widget.expenseItem?.receivedFrom??'';

    }


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExpenseController>(
        builder: (expenseController) {
          return Column(mainAxisSize: MainAxisSize.min, children: [

            Row(spacing: Dimensions.paddingSizeDefault,
              children: [
                Expanded(child: AccountSelectionWidget(title: "account".tr)),
                Expanded(child: SelectExpenseCategoryWidget()),
              ],
            ),
            Row(spacing: Dimensions.paddingSizeDefault,
              children: [
                Expanded(child: DateSelectionWidget(title: "date".tr,)),
                Expanded(child: SelectFundWidget()),
              ],
            ),
            CustomTextField(title: "amount".tr,
                controller: amountController,
                isAmount: true,
                maxLength: 8,
                inputFormatters: [AppConstants.numberFormat],
                hintText: "amount".tr),

            CustomTextField(title: "voucher_no".tr,
                controller: voucherController,
                hintText: "Ex:-12345".tr),

            CustomTextField(title: "voucher_received_from".tr,
                controller: receivedFromController,
                hintText: "Mr. John".tr),


            CustomTextField(title: "note".tr,
                controller: detailsController,
                hintText: "a_few_words".tr),


            SizedBox(height: Dimensions.paddingSizeDefault),

            GetBuilder<ExpenseController>(
                builder: (expenseController) {
                  return expenseController.isLoading?
                  const SizedBox(height: 40, child: Center(child: CircularProgressIndicator())) :
                  CustomButton(onTap: (){
                    String? date = Get.find<DatePickerController>().formatedToDate;
                    String? account = Get.find<AccountController>().selectedAccountItem?.id;
                    int? fundId = Get.find<FundController>().selectedFundItem?.id;
                    String? category = Get.find<ExpanseCategoryController>().selectedExpenseCategoryItem?.id.toString();
                    String amount = amountController.text.trim();
                    String details = detailsController.text.trim();
                    String voucher = voucherController.text.trim();
                    String voucherReceivedFrom = receivedFromController.text.trim();



                    if(amount.isEmpty){
                      showCustomSnackBar("enter_amount".tr);
                    }
                    else if(category == null){
                      showCustomSnackBar("category_is_empty".tr);
                    }
                    else if(fundId == null){
                      showCustomSnackBar("select_fund".tr);
                    }
                    else if(amount.isEmpty){
                      showCustomSnackBar("enter_amount".tr);
                    }
                    else if(double.parse(amount) <= 0){
                      showCustomSnackBar("amount_should_be_positive".tr);
                    }
                    else{

                      ExpenseBody expense = ExpenseBody(
                        fundId: fundId,
                          accountId: int.parse(account!),
                          expenseCategoryId: int.parse(category),
                          amount: amount,
                          transactionDate: date,
                          voucherNo: voucher,
                          receivedFrom: voucherReceivedFrom,
                          note: details,
                          method: update? "PUT":"POST"
                      );
                      expenseController.createNewExpense(expense);
                    }
                  }, text: "confirm".tr);
                }
            )



          ],);
        }
    );
  }
}
