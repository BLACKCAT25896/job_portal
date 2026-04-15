import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:mighty_job/feature/subsscription/presentation/screens/subscription_screen.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class AnnouncementScreen extends StatelessWidget {

  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (profileController) {
        return (!profileController.onOff && profileController.remainDays <= 7)?
        InkWell(onTap: () {
          AppConstants.pixel("subscription");
          Get.to(() => const SubscriptionScreen());
        },
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
              child: Container(decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall)),
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
                child: Row(children: [
                   Expanded(child: Text("${profileController.profileModel?.data?.subscription?.package?.packageType??''} ${profileController.remainDays} days Left", style: textRegular,)),
                    InkWell(onTap: () => profileController.changeAnnouncementOnOff(),
                        child: const Icon(Icons.clear)),
                  ],
                )),
            ),
        ): const SizedBox();
      }
    );
  }
}
