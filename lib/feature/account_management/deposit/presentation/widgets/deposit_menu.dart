import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mighty_job/common/widget/custom_menu/custom_menu_button_widget.dart';
import 'package:mighty_job/common/widget/custom_menu/custom_menu_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';

class DepositMenu extends StatelessWidget {
  const DepositMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMenuButtonWidget(
        openForegroundColor: Colors.white,
        closedBackgroundColor: systemPrimaryColor(),
        openBackgroundColor: systemPrimaryColor(),
        labelsBackgroundColor: Theme.of(context).cardColor,
        speedDialChildren: <CustomMenuWidget>[
          CustomMenuWidget(
            child: const Icon(Icons.file_download_rounded),
            foregroundColor: Colors.white,
            backgroundColor: systemPrimaryColor(),
            label: 'excel'.tr,
            onPressed: () {

            },
            closeSpeedDialOnPressed: false,
          ),
          CustomMenuWidget(
            child: const Icon(Icons.file_download_rounded),
            foregroundColor: Colors.white,
            backgroundColor: systemPrimaryColor(),
            label: 'pdf'.tr,
            onPressed: () {

            },
            closeSpeedDialOnPressed: false,
          ),
          CustomMenuWidget(
            child: const Icon(Icons.add),
            foregroundColor: Colors.white,
            backgroundColor: systemPrimaryColor(),
            label: 'create'.tr,
            onPressed: () {

            },
            closeSpeedDialOnPressed: false,
          ),

        ],
        child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Image.asset(Images.menuIcon, color: Colors.white,),
        ));
  }
}
