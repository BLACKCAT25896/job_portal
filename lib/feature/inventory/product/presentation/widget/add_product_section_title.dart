import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddProductSectionTitle extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final bool isRequired;
  const AddProductSectionTitle({super.key, this.onTap, required this.title,  this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault,
          bottom: Dimensions.paddingSizeExtraSmall),
      child: Row(children: [

        Text(title.tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
        if(isRequired)

        Text('*',style: textSemiBold.copyWith(color: Theme.of(context).colorScheme.error,
            fontSize: Dimensions.fontSizeDefault),),
        const Spacer(),

        if(onTap != null)
        InkWell(onTap: onTap, child: CustomContainer(verticalPadding: 0,
            horizontalPadding: 5,borderRadius: 2,
            child: Text("generate_code".tr,
                style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall))))
      ]),
    );
  }
}
