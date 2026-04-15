import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/feature/account_management/deposit/presentation/screen/create_new_deposit.dart';
import 'package:mighty_job/feature/account_management/expense/presentation/screen/create_new_expense_screen.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class AccountMobileBottomSection extends StatelessWidget {
  const AccountMobileBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Theme.of(context).cardColor, boxShadow: ThemeShadow.getShadow()),
      height: 70, child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Row(children: [
          Expanded(child: CustomButton(textColor: Colors.white,
              buttonColor: const Color(0xFF128E32),
              fontWeight: FontWeight.w500,
              borderRadius: 6,
              onTap: ()=> Get.to(()=> const CreateNewDepositScreen()), text: "money_in".tr),),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          Expanded(child: CustomButton(
              textColor: Colors.white,
              buttonColor: const Color(0xFFE11515),
              fontWeight: FontWeight.w500,
              borderRadius: 6,
              onTap: ()=> Get.to(()=> const CreateNewExpenseScreen()), text: "money_out".tr)),
        ],),
      ),);
  }
}
