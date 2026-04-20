import 'package:flutter/material.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String? details;
  final Widget? widget;
  final double? width;
  final double? space;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomRow({super.key, required this.title, this.details,
    this.width, this.widget, this.space, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, spacing: space ?? 100,
      crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(width: width, child: Text(title,
          style: textMedium.copyWith(fontWeight: fontWeight?? FontWeight.w600,
              fontSize: fontSize?? Dimensions.fontSizeDefault))),
        widget??
      Flexible(child: Text(details??'', style: textMedium,textAlign: TextAlign.end,))
    ],);
  }
}
