import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class ConfirmationDialogWidget extends StatelessWidget {
  final String icon;
  final String? title;
  final String description;
  final Function onYesPressed;
  final bool isLogOut;
  final bool hasCancel;
   const ConfirmationDialogWidget({super.key, required this.icon, this.title, required this.description, required this.onYesPressed, this.isLogOut = false, this.hasCancel = true});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
      child: Padding(
        padding:  const EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Column(mainAxisSize: MainAxisSize.min, children: [



          Padding(padding:  const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Text(description, style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault), textAlign: TextAlign.center)),
           const SizedBox(height: Dimensions.paddingSizeSmall),

          Row(children: [
            hasCancel ? Expanded(child: CustomButton(height: 28,
              borderRadius: 123,
              buttonColor: Colors.transparent,
              showBorderOnly: true,
              borderColor: Theme.of(context).colorScheme.error,
              onTap: () => isLogOut ? onYesPressed() : Get.back(),
              text: isLogOut ? 'yes'.tr : 'no'.tr,
            )) :  const SizedBox(),
            SizedBox(width: hasCancel ? Dimensions.paddingSizeLarge : 0),

            Expanded(child: CustomButton(borderRadius: 123, height: 34,
              text: isLogOut ? 'no'.tr : hasCancel ? 'yes'.tr : 'ok'.tr,
              onTap: () => isLogOut ? Get.back() : onYesPressed(),
            )),
          ])

        ]),
      ),
    );
  }
}