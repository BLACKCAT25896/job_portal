import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/domain/model/theme_item.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/presentation/widgets/hover_and_auto_scroll_image.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableThemeList extends StatelessWidget {
  const AvailableThemeList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemSettingsController>(builder: (controller) {
      return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: SingleChildScrollView(child: ResponsiveMasonryGrid(width: 500,
          children: availableThemes.map((theme) {
        final bool isActive = controller.defaultThemeModel?.defaultTheme?.id == theme.id;

        return CustomContainer(borderRadius: 5,showShadow: false,
          child: Column(spacing: Dimensions.paddingSizeDefault, children: [
            HoverAdvancedScrollImage(imageUrl: theme.image, height: 380,
              width: 600, speed: 30,),
            Row(children: [
              Expanded(child: Text(theme.key.tr, style: textRegular)),
              SizedBox(width: 110, child: CustomButton(
                onTap: () {
                  int? shopId = Get.find<ProfileController>().profileModel?.data?.shop?.id;
                  int themeId = theme.id;
                  controller.setActiveTheme(shopId!, themeId);
                },
                text: isActive ? "activated".tr : "active".tr)),
            ]),
          ]),
        );}).toList())),
      );
      },
    );
  }
}
