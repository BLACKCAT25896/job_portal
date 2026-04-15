import 'package:mighty_job/feature/subsscription/presentation/widgets/subscription_button_widget.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/subsscription/controller/subscription_controller.dart';
import 'package:mighty_job/feature/subsscription/domain/models/package_model.dart';
import 'package:mighty_job/helper/price_converter.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class SubscriptionItem extends StatelessWidget {
  final int index;
  final PackageItem? packageItem;
  const SubscriptionItem({super.key, required this.index, this.packageItem});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
      builder: (subscriptionController) {
        return Stack(children: [
            CustomContainer(border: index == subscriptionController.selectedPackage ?
            Border.all(color: systemPrimaryColor(), width: 1) : null,
              showShadow: index != subscriptionController.selectedPackage,
              borderRadius: Dimensions.paddingSizeExtraSmall,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(packageItem?.name??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                if(packageItem?.name?.toLowerCase() != "enterprise" && packageItem!.amount! > 0)
                Row(children: [
                    Text(PriceConverter.convertPrice(context, packageItem?.amount??0),
                        style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
                    const SizedBox(width: Dimensions.paddingSizeExtraSmall,),

                    if(packageItem?.amount != packageItem?.afterAmount)
                    Text(PriceConverter.convertPrice(context, packageItem?.afterAmount??0),
                        style: textSemiBold.copyWith(decoration: TextDecoration.lineThrough,
                            fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor)),
                  ]),


                Text("${"duration".tr} : ${packageItem?.durationInDays?.toString()??''} ${"days".tr}",
                    style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),


                if(MediaQuery.sizeOf(context).width>1000)
                Padding(
                  padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
                  child: SubscriptionButtonWidget(),
                )
              ],),),

            if(packageItem!.discount! > 0 && (packageItem?.name?.toLowerCase() != "enterprise"))
            Positioned(top: 0,right: 0,
                child: Container(decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(10))
                ),padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,
                    vertical: Dimensions.paddingSizeExtraSmall),
                    child: Text("${packageItem?.discount??''}% ${"off".tr}",
                        style: textRegular.copyWith()))),
          ],
        );
      }
    );
  }
}
