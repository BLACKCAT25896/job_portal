import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/domain/model/general_settings_model.dart';
import 'package:mighty_job/util/dimensions.dart';

class GeneralSettingsWidget extends StatefulWidget {
  const GeneralSettingsWidget({super.key});

  @override
  State<GeneralSettingsWidget> createState() => _GeneralSettingsWidgetState();
}

class _GeneralSettingsWidgetState extends State<GeneralSettingsWidget> {
  TextEditingController siteTitleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController currencySymbolController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController liveNoticeController = TextEditingController();
  TextEditingController appUrlController = TextEditingController();
  TextEditingController appVersionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final controller = Get.find<SystemSettingsController>();
    if (controller.generalSettingModel?.data != null) {
      _populateFields(controller.generalSettingModel!.data!);
    }
    controller.addListener(() {
      final data = controller.generalSettingModel?.data;
      if (data != null && siteTitleController.text.isEmpty) {
        _populateFields(data);
      }
    });
  }

  void _populateFields(SettingItem data) {
    siteTitleController.text = data.siteTitle ?? '';
    phoneController.text = data.phone ?? '';
    emailController.text = data.email ?? '';
    currencySymbolController.text = data.currencySymbol ?? '';
    addressController.text = data.address ?? '';
    liveNoticeController.text = data.headerNotice ?? '';
    appUrlController.text = data.appUrl ?? '';
    appVersionController.text = data.appVersion ?? '';
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemSettingsController>(
      builder: (settingsController) {
        return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: CustomContainer(showShadow: false, borderRadius: 5,
            child: Column(spacing: Dimensions.paddingSizeSmall, children: [
              CustomTitle(title: "general".tr, webTitle: true, leftPadding: 0),
              Row(spacing: Dimensions.paddingSizeSmall, children: [

                Expanded(child: CustomTextField(title: "site_title".tr,
                        hintText: "site_title".tr, controller: siteTitleController)),
                Expanded(child: CustomTextField(title: "currency_symbol".tr,
                        hintText: "currency_symbol".tr, controller: currencySymbolController))
              ]),


              Row(spacing: Dimensions.paddingSizeSmall, children: [
                Expanded(
                  child: CustomTextField(title: "phone".tr,
                      hintText: "phone".tr, controller: phoneController),
                ),
                Expanded(
                    child: CustomTextField(title: "email".tr,
                        hintText: "email".tr, controller: emailController))
               ]),



              CustomTextField(title: "live_notice_on_head".tr,
                  minLines: 3, maxLines: 5, maxLength: 500,
                  inputType: TextInputType.multiline, inputAction: TextInputAction.newline,
                  hintText: "live_notice_on_head".tr, controller: liveNoticeController),


              Row(spacing: Dimensions.paddingSizeSmall, children: [
                Expanded(
                  child: CustomTextField(title: "app_version".tr,
                      hintText: "app_version".tr, controller: appVersionController),
                ),
                Expanded(
                    child: CustomTextField(title: "app_url".tr,
                        hintText: "app_url".tr, controller: appUrlController))]),

              Align(alignment: Alignment.centerRight,
                  child: SizedBox(width: 130, child: settingsController.loading?
                      Center(child: CircularProgressIndicator(color: systemPrimaryColor())):
                  CustomButton(onTap: (){
                    SettingItem body = SettingItem(
                      siteTitle: siteTitleController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      currencySymbol: currencySymbolController.text,
                      address: addressController.text,
                      headerNotice: liveNoticeController.text,
                      appVersion: appVersionController.text,
                      appUrl: appUrlController.text,
                    );
                    settingsController.updateGeneralSetting(body);
                  }, text: "save_settings".tr))),

            ],),
          ),
        );
      }
    );
  }
}
