import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
class PricingWidget extends StatelessWidget {
  final String? title;
  final String? amount;
  final bool isTotal;
  final bool isCoupon;
  final Function? onTap;
  const PricingWidget({super.key, this.title, this.amount, this.isTotal = false, this.isCoupon = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault,
          Dimensions.paddingSizeExtraSmall, Dimensions.paddingSizeDefault, Dimensions.paddingSizeExtraSmall),
      child: Row(children: [

        Text(title!, style: textRegular.copyWith(color: isTotal? systemPrimaryColor():
        Theme.of(context).hintColor,fontWeight: isTotal? FontWeight.w700: FontWeight.w500,
            fontSize: isTotal? Dimensions.fontSizeLarge: Dimensions.paddingSizeDefault),),
        const Spacer(),
        isCoupon?
        InkWell(onTap: onTap as void Function()?,
            child: const Icon(Icons.edit)):const SizedBox(),

        Text(amount!, style: textRegular.copyWith(color: isTotal?
        systemPrimaryColor():
        Theme.of(context).hintColor,
            fontWeight: isTotal? FontWeight.w700: FontWeight.w500,
            fontSize: isTotal? Dimensions.fontSizeLarge: Dimensions.paddingSizeDefault),),

      ],),
    );
  }
}