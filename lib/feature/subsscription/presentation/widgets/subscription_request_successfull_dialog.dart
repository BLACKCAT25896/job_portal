import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class SubscriptionRequestSuccessfulDialog extends StatelessWidget {
  const SubscriptionRequestSuccessfulDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
      insetPadding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("subscription_request_sent".tr,textAlign: TextAlign.center, style: textMedium.copyWith(fontSize: Dimensions.fontSizeOverLarge),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
            child: Text("call_you_soon".tr, style: textRegular,),
          ),
          Align(alignment: Alignment.bottomRight,
              child: SizedBox(width: 90, child: CustomButton(fontWeight: FontWeight.w500,
                  onTap: (){Get.back(); Get.back();}, text: "ok".tr)))
        ],),
      ),
    );
  }
}
