import 'package:flutter/material.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class CustomTextItemWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final int? maxLine;
  const CustomTextItemWidget({super.key, required this.text, this.color, this.maxLine, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(text, maxLines: maxLine?? 1,overflow: TextOverflow.ellipsis,
        style: textRegular.copyWith(fontSize: fontSize?? Dimensions.fontSizeSmall, color: color));
  }
}
