import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/image_picker_widget.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class SelectLogoWidget extends StatelessWidget {
  const SelectLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemSettingsController>(initState: (value){
      Get.find<SystemSettingsController>().getImageSetting();
      },
        builder: (controller) {
      final model = controller.imageSettingModel;

      return Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(spacing: Dimensions.paddingSizeDefault,children: [
          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: LogoItem(
              title: "website_header_logo_light_theme".tr,
              subTitle: "it_will_show_at_website_header_left_portion".tr,
              pickedFile: controller.headerLogo,
              imageUrl: model != null?"${AppConstants.imageBaseUrl}/shop_image_settings/${model.data?.headerLogoLightTheme}":"",
              loading: controller.loading,
              onPick: () => controller.pickImage(),
              onUpload: () => controller.uploadLogo(controller.headerLogo, "header",
              model?.data?.id??1))),

            Expanded(child: LogoItem(
              title: "website_header_logo_dark_theme".tr,
              subTitle: "it_will_show_at_website_header_left_portion_dark_theme".tr,
              pickedFile: controller.headerLogoDarkTheme,
              imageUrl: model != null? "${AppConstants.imageBaseUrl}/shop_image_settings/${model.data?.headerLogoDarkTheme}":"",
              loading: controller.loading,
              onPick: () => controller.pickImage(darkTheme: true),
              onUpload: () => controller.uploadLogo(controller.headerLogoDarkTheme,
                  "dark_header", model?.data?.id??1))),
          ]),


          Row(spacing: Dimensions.paddingSizeDefault, children: [
            Expanded(child: LogoItem(
              title: "website_footer_logo_light_theme".tr,
              subTitle: "it_will_show_at_website_footer_left_portion".tr,
              pickedFile: controller.footerLogo,
              imageUrl: model != null? "${AppConstants.imageBaseUrl}/shop_image_settings/${model.data?.footerLogoLightTheme}":"",
              loading: controller.loading,
              onPick: () => controller.pickImage(websiteFooter: true),
              onUpload: () => controller.uploadLogo(controller.footerLogo,
                  "footer", model?.data?.id??1))),

            Expanded(child: LogoItem(
              title: "website_footer_logo_dark_theme".tr,
              subTitle: "it_will_show_at_website_footer_left_portion_dark_theme".tr,
              pickedFile: controller.footerLogoDarkTheme,
              imageUrl: model != null? "${AppConstants.imageBaseUrl}/shop_image_settings/${model.data?.footerLogoDarkTheme}":"",
              loading: controller.loading,
              onPick: () => controller.pickImage(footerDarkTheme: true),

              onUpload: () => controller.uploadLogo(controller.footerLogoDarkTheme,
                  "footer_dark", model?.data?.id??1))),
          ]),
        ]),
      );
    });
  }
}

class LogoItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final dynamic pickedFile;
  final String imageUrl;
  final bool loading;
  final VoidCallback onPick;
  final VoidCallback onUpload;

  const LogoItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.pickedFile,
    required this.imageUrl,
    required this.loading,
    required this.onPick,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(verticalPadding: Dimensions.paddingSizeLarge, showShadow: false,
      child: Column(spacing: Dimensions.paddingSizeDefault, children: [
        LogoSectionHeading(title: title, subTitle: subTitle),

        ImagePickerWidget(pickedFile: pickedFile, imageUrl: imageUrl, onImagePicked: onPick),

        Text("logo_size".tr, style: textRegular.copyWith(color: Theme.of(context).hintColor,
              fontSize: Dimensions.fontSizeExtraSmall),
          textAlign: TextAlign.center),

        loading ? const CircularProgressIndicator() : SizedBox(width: 120,
          child: CustomButton(onTap: onUpload, text: "upload".tr)),
      ]),
    );
  }
}

class LogoSectionHeading extends StatelessWidget {
  final String title;
  final String subTitle;

  const LogoSectionHeading({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 4, children: [
      Text(title, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
      Text(subTitle, style: textRegular.copyWith(color: Theme.of(context).hintColor),
          textAlign: TextAlign.center),
    ]);
  }
}
