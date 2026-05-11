import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:job/feature/cms_management/cms_settings/domain/model/general_settings_model.dart';
import 'package:job/util/dimensions.dart';

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
    siteTitleController.text = data.appName ?? '';
    phoneController.text = data.companyPhone ?? '';
    emailController.text = data.companyEmail ?? '';
    currencySymbolController.text = data.currencySymbol ?? '';
    addressController.text = data.companyAddress ?? '';
    appVersionController.text = data.appVersion ?? '';
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemSettingsController>(
      builder: (settingsController) {
        return Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: CustomContainer(showShadow: false, borderRadius: 5,
            child: Column(spacing: Dimensions.paddingSizeSmall, children: [


              ResponsiveMasonryGrid(width: 500, children: [
                CustomTextField(title: "site_title".tr,
                    hintText: "site_title".tr,
                    controller: siteTitleController),
                CustomTextField(title: "currency_symbol".tr,
                    hintText: "currency_symbol".tr,
                    controller: currencySymbolController),

                CustomTextField(title: "phone".tr,
                    hintText: "phone".tr,
                    controller: phoneController),

                CustomTextField(title: "email".tr,
                    hintText: "email".tr,
                    controller: emailController),

                CustomTextField(title: "app_version".tr,
                    hintText: "app_version".tr,
                    controller: appVersionController),

                CustomTextField(title: "address".tr,
                    hintText: "address".tr,
                    controller: addressController),

              ]),



              Align(alignment: Alignment.centerRight,
                  child: SizedBox(width: 130, child: settingsController.loading?
                      Center(child: CircularProgressIndicator(color: systemPrimaryColor())):
                  CustomButton(onTap: (){
                    SettingItem body = SettingItem(
                      appName: siteTitleController.text,
                      companyPhone: phoneController.text,
                      companyEmail: emailController.text,
                      currencySymbol: currencySymbolController.text,
                      companyAddress: addressController.text,
                      appVersion: appVersionController.text,
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
