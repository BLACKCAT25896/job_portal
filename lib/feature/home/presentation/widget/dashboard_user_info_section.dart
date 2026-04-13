import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/home/presentation/widget/feature_menu_item_widget.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/helper/route_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

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
              Text('today_ecommerce_performance'.tr,
                style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha:0.7)),),

            ])),

            if(ResponsiveHelper.isDesktop(context))
            FeatureMenuItemWidget(onTap: ()=> Get.toNamed(RouteHelper.getPosRoute()),
                title: "pos".tr, imageUrl: Images.posIcon),


          ]),
        );
      }
    );
  }
}
