import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/util/dimensions.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      showShadow: false,
      borderRadius: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Dimensions.paddingSizeSmall,
        children: [
          CustomTitle(title: title, leftPadding: 0),
          ...children,
        ],
      ),
    );
  }
}
