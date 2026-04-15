import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class DashboardUserInfoSection extends StatelessWidget {
  const DashboardUserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (profileController) {
        return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${"welcome_back".tr}, ${profileController.profileModel?.data?.name??'N/A'} 👋',
                  style: textBold.copyWith(fontSize: 24, color: Theme.of(context).textTheme.bodyLarge?.color)),
              const SizedBox(height: 4),
              Text('today_mighty_job_performance'.tr,
                style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha:0.7)),),

            ])),

          ]),
        );
      }
    );
  }
}
