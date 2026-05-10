import 'package:job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';


class CustomAddNewButtonWidget extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final IconData? icon;
  const CustomAddNewButtonWidget({super.key, this.title, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(onTap: onTap,
        verticalPadding: 5, borderRadius: 5, color: systemPrimaryColor(),
        child: Row(spacing: Dimensions.paddingSizeSmall, mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center, children: [
            if(icon != null)
            Icon(icon, color: Colors.white),

            Text(title?? '', style: textRegular.copyWith(color: Colors.white)),
          ],
        ));
  }
}

