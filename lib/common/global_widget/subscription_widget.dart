
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:mighty_job/util/styles.dart';

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 70,
      child: GetBuilder<ProfileController>(builder: (profileController) {
          int remainingDays = 0;

            DateTime endDate = DateTime.now().add(Duration(days: 7));
            DateTime now = DateTime.now();
            remainingDays = endDate.difference(now).inDays;

          return InkWell(onTap: () {
           // Get.toNamed(RouteHelper.getSubscriptionRoute());
          },
            child: Container(padding: const EdgeInsets.all(10),decoration: BoxDecoration(
              color: systemPrimaryColor().withValues(alpha: .75),
            ),

              child: Row(spacing: Dimensions.paddingSizeSmall, children: [
                const CustomImage(isLocalAsset: true, image: Images.package, width: 40),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                        Expanded(child: Text("upgrade".tr, style: textMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeLarge))),
                        const Icon(Icons.arrow_forward_ios_rounded, size: 12,color: Colors.white)
                      ],
                    ),
                    Text("${'Trail'}: $remainingDays ${"days".tr}",
                      style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Colors.white)),

                  ]),
                )
              ]),
            ),
          );
        }
      ),
    );
  }
}
