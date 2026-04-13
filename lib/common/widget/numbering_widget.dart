import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';


class NumberingWidget extends StatelessWidget {
  final int index;
  final double? height;
  const NumberingWidget({super.key, required this.index, this.height});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeSmall, children: [
        CustomContainer(color: systemPrimaryColor().withValues(alpha: .2), height: height ?? 30,
            showShadow: false,
            borderRadius: 0, horizontalPadding: 5, verticalPadding: 5,
            child: Text('${index+1}'.padLeft(5, '0'),
                style: textSemiBold.copyWith(color: systemPrimaryColor()))),
        Container(width: 1, height: height?? 30,
          decoration: BoxDecoration(color: Theme.of(context).hintColor),),
      ],
    );
  }
}
