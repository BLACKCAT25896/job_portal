import 'package:flutter/material.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final String? icon;
  final String title;
  final Color? color;
  final Function()? onTap;
  const ProfileMenuItemWidget({super.key, this.icon, required this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Row(spacing: Dimensions.paddingSizeSmall, children: [
        SizedBox(width: 20,child: Image.asset(icon?? Images.profile, color: color)),
        Expanded(child: Text(title, style: textRegular.copyWith(color: color))),
        Icon(Icons.arrow_forward_ios_rounded, size: 12, color: color?? Theme.of(context).hintColor,)
      ]),
    );
  }
}
