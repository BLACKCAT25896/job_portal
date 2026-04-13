import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class ItemWidget extends StatelessWidget {
  final String? icon;
  final double? iconWidth;
  final String? title;
  final String? details;
  final int? quantity;
  final double? price;
  final double? iconSize;
  const ItemWidget({super.key, this.title, this.quantity, this.price, this.icon, this.iconWidth, this.details, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [

      if(icon != null)
        SizedBox(width: iconWidth?? 30, child: Image.asset(icon!, width: iconWidth??30)),

      if(details != null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical : Dimensions.paddingSizeExtraSmall),
          child: Text(details!.tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall), textAlign: TextAlign.center),
        ),

      if(title != null)
      Text(title!.tr, style: textRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall)),
      if(quantity != null)
        Text("$quantity", style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
      if(price != null)
        Text(PriceConverter.convertPrice(context, price!), style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
    ],);
  }
}