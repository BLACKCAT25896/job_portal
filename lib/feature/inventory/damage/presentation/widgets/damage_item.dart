import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/image_dialog.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/inventory/damage/domain/models/damage_model.dart';
import 'package:ecommerce/helper/date_converter.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DamageItemWidget extends StatelessWidget {
  final DamageItem? damageItem;
  final int index;
  const DamageItemWidget({super.key, this.damageItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeSmall,children: [
      NumberingWidget(index: index),
      InkWell(onTap: ()=> Get.dialog(ImageDialog(imageUrl: damageItem?.image??'')),
          child: CustomImage( image : damageItem?.image??'',
              width: 40, height: 40, fit: BoxFit.cover)),
      Expanded(child: CustomTextItemWidget(text:damageItem?.productVariant?.name.toString()??'',)),
      Expanded(child: CustomTextItemWidget(text:damageItem?.reason??'N/A',)),
      Expanded(child: CustomTextItemWidget(text:damageItem?.quantity.toString()??'')),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, damageItem?.totalCost??0))),
      Expanded(child: CustomTextItemWidget(text: DateConverter.quotationDateAndTime(DateTime.parse(damageItem?.createdAt??'')),)),
      ],
    ):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,
          vertical: 5),
      child: CustomContainer(borderRadius: 5,showShadow: false, child: Row(
        children: [
          InkWell(onTap: ()=> Get.dialog(ImageDialog(imageUrl: damageItem?.image??'')),
              child: CustomImage( image : damageItem?.image??'',
                  width: 40, height: 40, fit: BoxFit.cover)),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimensions.paddingSizeExtraSmall, children: [

            Text(damageItem?.productVariant?.name.toString()??'',
                style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
            Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
              Expanded(child: Text("${"qty".tr}: ${damageItem?.quantity?.toString()?? "1"}",
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall))),
              Text("${"total_damage".tr}: ${damageItem?.totalCost?.toString()?? "1"}",
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall))
            ]),
            Text("${"date".tr}: ${damageItem?.createdAt}",
                style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
          ])),

        ],
      )),
    );
  }
}