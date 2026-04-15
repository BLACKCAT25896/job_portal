import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/util/styles.dart';

class CustomActiveButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final bool active;
  final String title;
  const CustomActiveButtonWidget({super.key, this.onTap, required this.active, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(borderRadius: 120, verticalPadding: 0, horizontalPadding: 15,
        onTap: onTap,
        color: active? Theme.of(context).secondaryHeaderColor : Theme.of(context).cardColor,
        child: Center(child: Text(title.tr, style: textRegular.copyWith())));
  }
}
