import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class FooterNavigationLinkWidget extends StatelessWidget {
  const FooterNavigationLinkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final quickLinks = [

      {
        'label': 'about_us'.tr,
        'type': "about",
      },
      {
        'label': 'privacy_policy'.tr,
        'type': "privacy_policy",
      },
      {
        'label': 'terms_and_condition'.tr,
        'type': "terms_and_condition",
      },
      {
        'label': 'contact_us'.tr,
        'type': "contact"
      },

    ];

    final textStyle = textRegular.copyWith(
      color: Theme.of(context).hintColor,
      fontSize: 14,
    );

    return GetBuilder<LandingPageController>(
      builder: (landingPageController) => Padding(
        padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.isDesktop(context)? 0 : Dimensions.paddingSizeDefault),
        child: Column(spacing: Dimensions.paddingSizeDefault,
          crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("about_us".tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
            Column(spacing: Dimensions.paddingSizeDefault,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: quickLinks.map((item) {
                return InkWell(onTap: () => {

                },
                  child: Text(item['label'] as String, style: textStyle));
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
