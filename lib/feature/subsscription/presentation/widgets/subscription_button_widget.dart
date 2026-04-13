import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/feature/subsscription/controller/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionButtonWidget extends StatelessWidget {
  const SubscriptionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
        builder: (subscriptionController) {
          return (subscriptionController.selectedPackageName?.toLowerCase() == "enterprise" || subscriptionController.selectedPackageName?.toLowerCase() == "trial")?
          const SizedBox():
          CustomButton(text: "subscribe", onTap: (){
            int? packageId = subscriptionController.selectedPackageId;
            String userPhone = Get.find<ProfileController>().profileModel?.data?.phone??'';

            if(packageId == null){
              showCustomSnackBar("select_a_package".tr);
            }else{
              subscriptionController.purchasePackage(packageId, userPhone, "" );
            }
          },);
        }
    );
  }
}
