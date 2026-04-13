import 'package:ecommerce/common/widget/custom_dropdown.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';

class AccountingTypeWidget extends StatelessWidget {
  const AccountingTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("account_type".tr, style: textRegular),
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomDropdown(width: Get.width, title: "select".tr,
            items: accountController.accountTypes,
            selectedValue: accountController.selectedAccountType,
            onChanged: (val){
              accountController.setSelectAccountTypeType(val!);
            },
          ),),
      ],);
        }
    );
  }
}
