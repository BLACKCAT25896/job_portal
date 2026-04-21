import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class JobSeekers extends StatelessWidget {
  const JobSeekers({super.key});

  @override
  Widget build(BuildContext context) {
    final quickLinks = [

      {
        'label': 'My ${AppConstants.appName} Panel'.tr,
        'type': "my_${AppConstants.appName}_panel",
      },
      {
        'label': 'list_of_feature'.tr,
        'type': "list_of_feature",
      },
      {
        'label': 'FAQ'.tr,
        'type': "faq"
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
            Text("job_seekers".tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
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
