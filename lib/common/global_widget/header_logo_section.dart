import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/domain/model/image_setting_model.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/app_constants.dart';

class HeaderLogoSection extends StatelessWidget {
  const HeaderLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemSettingsController>(
      initState: (value){
        if(Get.find<SystemSettingsController>().mighty_jobImageSettingModel == null){
          Get.find<SystemSettingsController>().getmighty_jobImageSetting();
        }
      },
      builder: (systemSettingsController) {
        ImageSettingModel ? imageSettingModel = systemSettingsController.mighty_jobImageSettingModel;

        String? lightLogo =  imageSettingModel?.data?.headerLogoLightTheme;
        String? darkLogo =  imageSettingModel?.data?.headerLogoDarkTheme;
        String ? logoToShow = Get.isDarkMode? darkLogo : lightLogo;
        return (imageSettingModel != null && imageSettingModel.data != null )?
        Padding(padding: const EdgeInsets.all(16),
            child: InkWell(onTap: () => Get.toNamed(RouteHelper.getInitialRoute()),
                child: SizedBox(height: 70, child: CustomImage(
                  image: '${AppConstants.imageBaseUrl}/shop_image_settings/$logoToShow',
                  fit: BoxFit.contain,
                )))): SizedBox();
      }
    );
  }
}


class FooterLogoSection extends StatelessWidget {
  const FooterLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemSettingsController>(
        initState: (value){
          if(Get.find<SystemSettingsController>().mighty_jobImageSettingModel == null){
            Get.find<SystemSettingsController>().getmighty_jobImageSetting();
          }
        },
        builder: (systemSettingsController) {
          ImageSettingModel ? imageSettingModel = systemSettingsController.mighty_jobImageSettingModel;

          String? lightLogo =  imageSettingModel?.data?.footerLogoLightTheme;
          String? darkLogo =  imageSettingModel?.data?.footerLogoDarkTheme;
          String ? logoToShow = Get.isDarkMode? darkLogo : lightLogo;
          return (imageSettingModel != null && imageSettingModel.data != null )?
          Padding(padding: const EdgeInsets.all(16),
              child: InkWell(onTap: () => Get.toNamed(RouteHelper.getDashboardRoute()),
                  child: SizedBox(height: 40, child: CustomImage(
                    image: '${AppConstants.imageBaseUrl}/shop_image_settings/$logoToShow',
                    fit: BoxFit.contain,
                  )))): SizedBox();
        }
    );
  }
}
