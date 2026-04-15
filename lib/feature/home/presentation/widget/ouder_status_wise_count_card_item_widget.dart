

import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';

class OrderStatusWiseCountCardWidget extends StatelessWidget {
  final int count;
  final String icon;
  final String title;
  final Color? cardColor;
  const OrderStatusWiseCountCardWidget({super.key,
    required this.icon, required this.title, required this.count,
    this.cardColor});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(borderRadius: 5, color: cardColor,
        verticalPadding: Dimensions.paddingSizeDefault,
        horizontalPadding: Dimensions.paddingSizeDefault,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dimensions.paddingSizeDefault, children: [

              Row(spacing: Dimensions.paddingSizeSmall, children: [
                CustomImage(width: 18, image: icon, isLocalAsset: true,),

                Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(title.toString(), style: textRegular.copyWith()))),

                Text(count.toString(), style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

              ])
            ]
        )
    );
  }
}