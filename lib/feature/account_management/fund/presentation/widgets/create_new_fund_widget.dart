
import 'package:mighty_job/feature/account_management/accounting/logic/account_controller.dart';
import 'package:mighty_job/feature/account_management/accounting/presentation/widgets/accounting_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/account_management/fund/domain/model/fund_body.dart';
import 'package:mighty_job/feature/account_management/fund/domain/model/fund_model.dart';
import 'package:mighty_job/feature/account_management/fund/logic/fund_controller.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';


class CreateNewFundWidget extends StatefulWidget {
  final FundItem? fund;
  const CreateNewFundWidget({super.key, this.fund});

  @override
  State<CreateNewFundWidget> createState() => _CreateNewFundWidgetState();
}

class _CreateNewFundWidgetState extends State<CreateNewFundWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController openingBalanceController = TextEditingController();
  TextEditingController currentBalanceBalanceController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    if(widget.fund != null){
      update = true;
      nameController.text = widget.fund?.name??'';
      codeController.text = widget.fund?.code??'';
      openingBalanceController.text = widget.fund?.openingBalance?.toString()??'0';
      currentBalanceBalanceController.text = widget.fund?.currentBalance?.toString()??'0';


    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FundController>(
        builder: (fundControlling) {
          return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,spacing: Dimensions.paddingSizeDefault,  children: [

                CustomTextField(title: "name".tr,
                  controller: nameController,
                  hintText: "enter_name".tr,),

                Row(spacing: Dimensions.paddingSizeSmall, children: [
                  Expanded(child: CustomTextField(title: "code".tr,
                      controller: codeController, hintText: "code".tr)),

                  Expanded(child: AccountingTypeWidget()),
                ]),

                Row(spacing: Dimensions.paddingSizeDefault, children: [
                  Expanded(
                    child: CustomTextField(title: "opening_balance".tr,
                      controller: openingBalanceController,
                      inputFormatters: [AppConstants.numberFormat],
                      inputType: TextInputType.number,
                      hintText: "opening_balance".tr,),
                  ),
                  Expanded(
                    child: CustomTextField(title: "current_balance".tr,
                      controller: currentBalanceBalanceController,
                      inputFormatters: [AppConstants.numberFormat],
                      inputType: TextInputType.number,
                      hintText: "current_balance".tr,),
                  ),


                ]),



                fundControlling.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Center(child: CircularProgressIndicator())):

                Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                    child: CustomButton(onTap: (){
                      String name = nameController.text.trim();
                      String? code = codeController.text.trim();
                      String? type = Get.find<AccountController>().selectedAccountType;
                      String? openingBalance = openingBalanceController.text.trim();
                      String? currentBalance = currentBalanceBalanceController.text.trim();


                      if(name.isEmpty){
                        showCustomSnackBar("name_is_empty".tr);
                      }
                      else if(code.isEmpty){
                        showCustomSnackBar("code_is_empty".tr);
                      }
                      else if(type == null){
                        showCustomSnackBar("select_type".tr);
                      }else if(openingBalance.isEmpty){
                        showCustomSnackBar("opening_balance_is_empty".tr);
                      }
                      else if(currentBalance.isEmpty){
                        showCustomSnackBar("current_balance_is_empty".tr);
                      }
                      else{
                        FundBody body = FundBody(
                            name: name,
                            code: code,
                            type: type,
                            openingBalance: openingBalance,
                            currentBalance: currentBalance,
                            sMethod: update? 'put' : 'post'
                        );
                        if(update){
                          fundControlling.editFund(body, widget.fund!.id!);
                        }else{
                          fundControlling.createFund(body);
                        }
                      }
                    }, text: update? "update".tr : "save".tr))
              ],),
            ),
          );
        }
    );
  }
}
