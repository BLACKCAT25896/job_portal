import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_checkbox.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';

class CheckboxItem extends StatelessWidget {
  final String title;
  final bool value;
  final Function()? onChanged; // Correct type

  const CheckboxItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      showShadow: false,
      horizontalPadding: 5,
      verticalPadding: 0,
      color: Theme.of(context).hintColor.withValues(alpha: 0.1),
      borderRadius: 5,
      child: CustomCheckbox(
        title: title.tr,
        value: value,
        onChange: onChanged,
      ),
    );
  }
}
