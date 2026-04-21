import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class JobRecruiter extends StatelessWidget {
  const JobRecruiter({super.key});

  @override
  Widget build(BuildContext context) {
    final quickLinks = [

      {
        'label': 'create_account'.tr,
        'type': "create_account",
      },
      {
        'label': 'product_or_service'.tr,
        'type': "product_or_service",
      },
      {
        'label': 'post_job'.tr,
        'type': "post_job",
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
