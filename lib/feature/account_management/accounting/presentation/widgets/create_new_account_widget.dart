import 'package:ecommerce/feature/account_management/accounting/presentation/widgets/accounting_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/account_management/accounting/domain/model/account_body_model.dart';
import 'package:ecommerce/feature/account_management/accounting/domain/model/account_model.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewAccountWidget extends StatefulWidget {
  final AccountItem? accountItem;
  const CreateNewAccountWidget({super.key, this.accountItem});

  @override
  State<CreateNewAccountWidget> createState() => _CreateNewAccountWidgetState();
}

class _CreateNewAccountWidgetState extends State<CreateNewAccountWidget> {
  TextEditingController  accountNumber = TextEditingController();
  TextEditingController accountName = TextEditingController();
  TextEditingController accountBalance = TextEditingController();

  bool updateAccount = false;

  @override
  void initState() {

    if(widget.accountItem != null) {
      accountNumber.text = widget.accountItem?.code??'';
      accountName.text = widget.accountItem?.name??'';
      accountBalance.text = "${widget.accountItem?.currentBalance??0}";
      updateAccount = true;

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController) {
      return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [


          AccountingTypeWidget(),

        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(
            child: CustomTextField(title: "account_number".tr,
              controller: accountNumber,
              hintText: "enter_account_number".tr,),
          ),


          Expanded(
            child: CustomTextField(title: "account_name".tr,
              controller: accountName,
              hintText: "enter_account_name".tr,),
          ),


        ]),
          CustomTextField(title: "balance".tr,
            controller: accountBalance,
            isAmount: true,
            maxLength: 8,
            inputFormatters: [AppConstants.numberFormat],
            hintText: "enter_account_balance".tr,),


          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: accountController.isLoading? const CircularProgressIndicator():
            CustomButton(onTap: () async {

              String number = accountNumber.text.trim();
              String name = accountName.text.trim();
              String balance = accountBalance.text.trim();
              String? type = accountController.selectedAccountType;

              if(number.isEmpty){
                showCustomSnackBar("account_number_is_empty".tr);
              }
              else if(type == null){
                showCustomSnackBar("account_type_is_empty".tr);
              }
              else if(name.isEmpty){
                showCustomSnackBar("account_name_is_empty".tr);
              }
              else if(balance.isEmpty){
                showCustomSnackBar("account_balance_is_empty".tr);
              }else{
                AccountBodyModel accountBody = AccountBodyModel(
                  code: number,
                  name: name,
                  currentBalance: balance,
                  type: type
                );
                if(updateAccount){
                  accountController.updateAccount(accountBody, int.parse(widget.accountItem!.id!));
                }else{
                  accountController.createNewAccount(accountBody);
                }
              }
            }, text: "confirm".tr),
          )


        ],
        ),
      );
    });
  }
}
