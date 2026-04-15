import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class CustomBottomNavigationButton extends StatelessWidget {
  final String title;
  final String? icon;
  final Function()? onTap;
  const CustomBottomNavigationButton({super.key, required this.title, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return !ResponsiveHelper.isDesktop(context)?
    Container(decoration: BoxDecoration(color: Theme.of(context).cardColor, boxShadow: ThemeShadow.getShadow()),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: CustomButton(icon: icon != null?
        SizedBox(width: 15, child: Image.asset(icon!, color: Colors.white)):
        const Icon(Icons.add, size: 20, color: Colors.white), onTap: onTap,
            fontWeight: FontWeight.w400, fontSize: Dimensions.fontSizeDefault,
            text: title.tr),
      ),
    ): SizedBox();
  }
}
