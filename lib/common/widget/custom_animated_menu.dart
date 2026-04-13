import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ecommerce/common/widget/custom_menu/custom_menu_button_widget.dart';
import 'package:ecommerce/common/widget/custom_menu/custom_menu_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';

class CustomAnimatedMenu extends StatelessWidget {
  const CustomAnimatedMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: CustomMenuButtonWidget(
          openForegroundColor: Colors.white,
          closedBackgroundColor: systemPrimaryColor(),
          openBackgroundColor: systemPrimaryColor().withValues(alpha: .75),
          labelsBackgroundColor: Theme.of(context).cardColor,
          speedDialChildren: <CustomMenuWidget>[
            CustomMenuWidget(
              child: const Icon(Icons.directions_run),
              foregroundColor: Colors.white,
              backgroundColor: systemPrimaryColor(),
              label: 'ongoing_ride'.tr,
              onPressed: () {

              },
              closeSpeedDialOnPressed: false,
            ),
            CustomMenuWidget(
              child: const Icon(Icons.add),
              foregroundColor: Colors.white,
              backgroundColor: systemPrimaryColor(),
              label: 'parcel_delivery'.tr,
              onPressed: () {

              },
              closeSpeedDialOnPressed: false,
            ),

          ],
          child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Image.asset(Images.menuIcon),
          )),);
  }
}
