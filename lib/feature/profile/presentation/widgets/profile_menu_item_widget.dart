import 'package:flutter/material.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final String? icon;
  final String title;
  final Color? color;
  final Function()? onTap;
  const ProfileMenuItemWidget({super.key, this.icon, required this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
        child: Row(spacing: Dimensions.paddingSizeSmall, children: [
          SizedBox(width: 25,child: Image.asset(icon?? Images.profile, color: color)),
          Expanded(child: Text(title, style: textRegular.copyWith(color: color))),
          Icon(Icons.arrow_forward_ios_rounded, size: 12, color: color?? Theme.of(context).hintColor,)
        ]),
      ),
    );
  }
}
