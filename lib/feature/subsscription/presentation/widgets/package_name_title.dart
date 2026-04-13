import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/subsscription/controller/subscription_controller.dart';
import 'package:ecommerce/feature/subsscription/domain/models/package_model.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class SubscriptionPackageNameTitle extends StatelessWidget {
  final int index;
  final PackageItem? packageItem;
  const SubscriptionPackageNameTitle({super.key, required this.index, this.packageItem});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
        builder: (subscriptionController) {
          return Column( children: [
            Text(packageItem?.name??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
            if(packageItem?.name?.toLowerCase() != "enterprise" && packageItem!.amount! > 0)
              Row(children: [
                Text(PriceConverter.convertPrice(context, packageItem?.amount??0),
                    style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
                const SizedBox(width: Dimensions.paddingSizeExtraSmall,),
              ]),

            Text("${"duration".tr} : ${packageItem?.durationInDays?.toString()??''} ${"days".tr}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),



          ],);
        }
    );
  }
}
