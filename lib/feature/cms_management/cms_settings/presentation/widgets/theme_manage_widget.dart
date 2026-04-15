import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/presentation/widgets/style_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class ThemeManageWidget extends StatelessWidget {
  const ThemeManageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemSettingsController>(
      builder: (systemSettingsController) {
        return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Column(spacing: Dimensions.paddingSizeDefault,
            children: [
              CustomTitle(title: "light_theme", leftPadding: 0,),
              CustomContainer(showShadow: false, borderRadius: 5,
                child: ResponsiveMasonryGrid(width: 600,  children: [
                  //Light
                  ColorPickerField(
                    initialColor: systemSettingsController.primaryColor,
                    label: 'primary_color'.tr,
                    onChanged: (val){
                      int hexInt = val.toARGB32();
                      String hexColor = '0x${hexInt.toRadixString(16).padLeft(8, '0').toUpperCase()}';
                      log("Primary Color is ==> $hexColor");
                      systemSettingsController.updatePrimaryColor(hexColor);
                    },
                  ),
                  ColorPickerField(
                    initialColor: systemSettingsController.secondaryColor,
                    label: 'secondary_color'.tr,
                    onChanged: (val){
                      int hexInt = val.toARGB32();
                      String hexColor = '0x${hexInt.toRadixString(16).padLeft(8, '0').toUpperCase()}';
                      log("Primary Color is ==> $hexColor");
                      systemSettingsController.updatePrimaryColor(hexColor);
                    },
                  ),
                  ColorPickerField(
                    initialColor: systemSettingsController.primaryContainerColor,
                    label: 'primary_container_color'.tr,
                    onChanged: (val){
                      int hexInt = val.toARGB32();
                      String hexColor = '0x${hexInt.toRadixString(16).padLeft(8, '0').toUpperCase()}';
                      log("Primary Color is ==> $hexColor");
                      systemSettingsController.updatePrimaryContainerColor(hexColor);
                    },
                  ),

                  ColorPickerField(
                    initialColor: systemSettingsController.textColor,
                    label: 'text_color'.tr,
                    onChanged: (val){
                      int hexInt = val.toARGB32();
                      String hexColor = '0x${hexInt.toRadixString(16).padLeft(8, '0').toUpperCase()}';
                      log("Text Color is ==> $hexColor");
                      systemSettingsController.updateTextColor(hexColor);
                    },
                  ),

                  ColorPickerField(
                    initialColor: systemSettingsController.sidebarColor,
                    label: 'sidebar_color'.tr,
                    onChanged: (val){
                      int hexInt = val.toARGB32();
                      String hexColor = '0x${hexInt.toRadixString(16).padLeft(8, '0').toUpperCase()}';
                      log("Sidebar Color is ==> $hexColor");
                      systemSettingsController.updateSidebarColor(hexColor);
                    },
                  ),
                  ColorPickerField(
                    initialColor: systemSettingsController.sidebarTextColor,
                    label: 'sidebar_text_color'.tr,
                    onChanged: (val){
                      int hexInt = val.toARGB32();
                      String hexColor = '0x${hexInt.toRadixString(16).padLeft(8, '0').toUpperCase()}';
                      log("Sidebar Text Color is ==> $hexColor");
                      systemSettingsController.updateSidebarTextColor(hexColor);
                    },
                  ),
                ],),
              ),
              CustomTitle(title: "dark_theme", leftPadding: 0,),
              CustomContainer(showShadow: false, borderRadius: 5,
                child: ResponsiveMasonryGrid(width: 600, children: [
                  //Light
                  ColorPickerField(
                    initialColor: systemSettingsController.primaryColor,
                    label: 'primary_color'.tr,
                    onChanged: (val){
                      int hexInt = val.toARGB32();
                      String hexColor = '0x${hexInt.toRadixString(16).padLeft(8, '0').toUpperCase()}';
                      log("Primary Color is ==> $hexColor");
                      systemSettingsController.updatePrimaryColor(hexColor);
                    },
                  ),
                  ColorPickerField(
                    initialColor: systemSettingsController.secondaryColor,
                    label: 'secondary_color'.tr,
                    onChanged: (val){
                      int hexInt = val.toARGB32();
                      String hexColor = '0x${hexInt.toRadixString(16).padLeft(8, '0').toUpperCase()}';
                      log("Primary Color is ==> $hexColor");
                      systemSettingsController.updatePrimaryColor(hexColor);
                    },
                  ),
                  ColorPickerField(
                    initialColor: systemSettingsController.primaryContainerColor,
                    label: 'primary_container_color'.tr,
                    onChanged: (val){
                      int hexInt = val.toARGB32();
                      String hexColor = '0x${hexInt.toRadixString(16).padLeft(8, '0').toUpperCase()}';
                      log("Primary Color is ==> $hexColor");
                      systemSettingsController.updatePrimaryContainerColor(hexColor);
                    },
                  ),

                  ColorPickerField(
                    initialColor: systemSettingsController.textColor,
                    label: 'primary_container_color'.tr,
                    onChanged: (val){
                      int hexInt = val.toARGB32();
                      String hexColor = '0x${hexInt.toRadixString(16).padLeft(8, '0').toUpperCase()}';
                      log("Primary Color is ==> $hexColor");
                      systemSettingsController.updateTextColor(hexColor);
                    },
                  ),
                ],),
              ),
            ],
          ),
        );
      }
    );
  }
}
