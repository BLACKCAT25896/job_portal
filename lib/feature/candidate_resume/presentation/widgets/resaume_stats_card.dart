import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class ResumeStatsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? color;
  final Function()? onTap;

  const ResumeStatsCard({super.key, required this.icon,
    required this.title, required this.value, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(onTap: onTap,
      verticalPadding: Dimensions.paddingSizeDefault,
      color: color,
      child: Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
        Icon(icon, size: 40, color: systemPrimaryColor()),
        const SizedBox(width: 12),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: textRegular),
          Text(value, style: textSemiBold.copyWith(
            fontSize: Dimensions.fontSizeExtraLarge)),
        ]),
        ],
      ),
    );
  }
}