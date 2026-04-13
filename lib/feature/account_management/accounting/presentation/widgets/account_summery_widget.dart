import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';
import 'package:ecommerce/feature/account_management/accounting/presentation/screen/accounting_list_screen.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class AccountSummeryWidget extends StatelessWidget {

  const AccountSummeryWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AccountController>(
      builder: (accountController) {
        return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: CustomContainer(onTap: (){
            if(Get.find<ProfileController>().hasPermission("account-index")){
              Get.to(()=> const AccountListScreen());
            }
          },
              borderRadius: 5,width: Get.width, child: Column(children: [

                Text('balance'.tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
                Text(PriceConverter.convertPrice(context, accountController.balance), style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeOverLarge)),
              ])),
        );
      }
    );
  }
}
