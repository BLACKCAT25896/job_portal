import 'package:flutter/material.dart';
import 'package:ecommerce/util/styles.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String? details;
  final Widget? widget;
  final double? width;
  final double? space;
  const CustomRow({super.key, required this.title, this.details,
    this.width, this.widget, this.space});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, spacing: space ?? 100,
      crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(width: width, child: Text(title, style: textMedium,)),
        widget??
      Flexible(child: Text(details??'', style: textMedium,textAlign: TextAlign.end,))
    ],);
  }
}
