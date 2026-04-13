
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';
import 'package:ecommerce/feature/account_management/accounting/presentation/widgets/account_selection_widget.dart';
import 'package:ecommerce/feature/account_management/deposit/domain/model/deposit_body.dart';
import 'package:ecommerce/feature/account_management/deposit/domain/model/deposit_model.dart';
import 'package:ecommerce/feature/account_management/deposit/logic/deposit_controller.dart';
import 'package:ecommerce/feature/account_management/deposit_category/logic/deposit_category_controller.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/widgets/deposit_category_selection_widget.dart';
import 'package:ecommerce/feature/account_management/fund/logic/fund_controller.dart';
import 'package:ecommerce/feature/account_management/fund/presentation/widgets/select_fund_widget.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewDepositWidget extends StatefulWidget {
  final DepositItem? depositItem;
  const CreateNewDepositWidget({super.key, this.depositItem});

  @override
  State<CreateNewDepositWidget> createState() => _CreateNewDepositWidgetState();
}

class _CreateNewDepositWidgetState extends State<CreateNewDepositWidget> {
  TextEditingController amountController = TextEditingController();
  TextEditingController voucherController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController receivedFromController = TextEditingController();




  bool update = false;
  @override
  void initState() {

    if(widget.depositItem != null){
      update = true;
      amountController.text = widget.depositItem?.amount.toString()??'0';
      voucherController.text = widget.depositItem?.voucherNo??'';
      noteController.text = widget.depositItem?.note??'';
     receivedFromController.text = widget.depositItem?.receivedFrom??'';


    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositController>(builder: (depositController) {
          return Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column( mainAxisSize: MainAxisSize.min, children: [


              Row(spacing: Dimensions.paddingSizeDefault, children: [
                Expanded(
                  child: CustomTextField(
                    title: "amount".tr,
                    controller: amountController,
                    hintText: "enter_amount".tr,
                    inputFormatters: [AppConstants.numberFormat],
                    inputType: TextInputType.number,
                  ),
                ),

                Expanded(
                  child: CustomTextField(
                    title: "voucher_no".tr,
                    controller: voucherController,
                    hintText: "enter_voucher_no".tr,
                    inputType: TextInputType.text,
                  ),
                ),

              ]),


              Row(spacing: Dimensions.paddingSizeDefault, children: [
                Expanded(child: AccountSelectionWidget(title: widget.depositItem?.account?.name)),
                Expanded(child: DepositCategorySelectionWidget()),

              ],),

              Row(spacing: Dimensions.paddingSizeDefault, children: [
                Expanded(child: SelectFundWidget()),
                Expanded(child: CustomTextField(
                  title: "received_from".tr,
                  controller: receivedFromController,
                  hintText: "select_customer".tr,

                )),
              ],),


              CustomTextField(title: "notes".tr,
                  controller: noteController,
                  hintText: "a_few_words".tr),

              const SizedBox(height: Dimensions.paddingSizeDefault,),

              GetBuilder<DepositController>(builder: (depositController) {
                return GetBuilder<AccountController>(builder: (accountController) {
                  return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      child: depositController.isLoading? const SizedBox(height: 40, child: Center(child: CircularProgressIndicator())):
                      CustomButton(onTap: (){
                        String date = AppConstants.formatedDate;
                        String amount = amountController.text.trim();
                        String notes = noteController.text.trim();
                        String receivedFrom = receivedFromController.text.trim();
                        int? fundId = Get.find<FundController>().selectedFundItem?.id;
                        String? accountId = Get.find<AccountController>().selectedAccountItem?.id;
                        String? depositCategoryId = Get.find<DepositCategoryController>().selectedCategory?.id.toString()?? widget.depositItem?.id;

                        if(depositCategoryId == null){
                          showCustomSnackBar("select_category".tr);
                        }
                        else if(fundId == null){
                          showCustomSnackBar("select_fund".tr);
                        }
                        else if(receivedFrom.isEmpty){
                          showCustomSnackBar("received_from_is_empty".tr);
                        }
                        else if(accountId == null){
                          showCustomSnackBar("select_account".tr);
                        }
                        else if(amount.isEmpty){
                          showCustomSnackBar("enter_amount".tr);
                        }
                        else if(double.parse(amount) <= 0){
                          showCustomSnackBar("enter_valid_amount".tr);
                        }
                        else{
                          DepositBody depositBody = DepositBody(
                              accountId: int.parse(accountId),
                              depositCategoryId : int.parse(depositCategoryId),
                              amount: amount,
                              receivedFrom: receivedFrom,
                              fundId: fundId,
                              note: notes,
                              voucherNo: voucherController.text.trim(),
                              sMethod: update? "PUT" : "POST",
                              transactionDate: date);
                          if(update){
                            depositController.updateDeposit(depositBody, int.parse(widget.depositItem!.id!));
                          }else{
                            depositController.createNewDeposit(depositBody);
                          }}}, text: "confirm".tr, ));
                        });
                  }
              )


            ]),
          );
        }
    );
  }
}
