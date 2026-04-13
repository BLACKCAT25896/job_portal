import 'package:flutter/material.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class CustomItemTextWidget extends StatelessWidget {
  final String? text;
  final int? maxLines;
  const CustomItemTextWidget({super.key, this.text, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: maxLines?? 1,
      overflow: TextOverflow.ellipsis,
      style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
    );
  }
}
