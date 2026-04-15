                       import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_checkbox.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';

class WhatsappSetting extends StatefulWidget {
  const WhatsappSetting({super.key});

  @override
  State<WhatsappSetting> createState() => _WhatsappSettingState();
}

class _WhatsappSettingState extends State<WhatsappSetting> {
  TextEditingController whatsappNumberController = TextEditingController();



  Widget buildSaveButton() {
    return GetBuilder<SystemSettingsController>(
      builder: (controller) {
        return SizedBox(width: 70, child: controller.loading? Center(child: CircularProgressIndicator()):
        CustomButton(text: "save".tr, onTap: () {
          String whatsappNumber = whatsappNumberController.text.trim();
          int chatEnable = controller.chatEnable?1:0;
          int orderEnable = controller.orderEnable?1:0;

          if(whatsappNumber.isEmpty){
            showCustomSnackBar("number_is_empty".tr);
          }else{
            controller.whatsappSetting(whatsappNumber, chatEnable, orderEnable);
          }

        }));
      }
    );
  }

  Widget buildChatEnable() {
    return GetBuilder<SystemSettingsController>(
      builder: (controller) {
        return CustomCheckbox(title: "chat_enable".tr, onChange: () {
          controller.setChatEnable(!controller.chatEnable);
        }, value: controller.chatEnable,);
      }
    );
  }

  Widget buildOrderEnable() {
    return GetBuilder<SystemSettingsController>(
      builder: (controller) {
        return CustomCheckbox(title: "whatsapp_order_enable".tr, onChange: () {
          controller.setOrderEnable(!controller.orderEnable);
        }, value: controller.orderEnable,);
      }
    );
  }

  @override
  void initState() {
    super.initState();
    if(Get.find<SystemSettingsController>().generalSettingModel != null){
      whatsappNumberController.text = Get.find<SystemSettingsController>().generalSettingModel?.data?.whatsAppLink ?? "";
      Get.find<SystemSettingsController>().setChatEnable(Get.find<SystemSettingsController>().generalSettingModel?.data?.whatsappChatEnable == 1?true:false, notify: false);

    }
  }



  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Scaffold(appBar: CustomAppBar(title: "whatsapp_setting".tr),
      body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(child: Column(children: [
                SizedBox(height: isDesktop ? 0 : Dimensions.paddingSizeDefault),
                SectionHeaderWithPath(sectionTitle: "whatsapp_setting".tr),
                Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                  child: CustomContainer(showShadow: false, borderRadius: 5,
                    child: isDesktop ? Row(spacing: Dimensions.paddingSizeDefault,
                      crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Expanded(child: CustomTextField(title: "whatsapp_number".tr,
                            hintText: "+1 853 12121212",
                          inputType: TextInputType.phone,
                          inputFormatters: [AppConstants.phoneNumberFormat],
                          controller: whatsappNumberController)),
                        IntrinsicWidth(child: buildChatEnable()),
                        IntrinsicWidth(child: buildOrderEnable()),
                        buildSaveButton(),
                      ],
                    ) :
                    Column(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.end, children: [
                      CustomTextField(title: "whatsapp_number".tr,
                        hintText: "+1 853 12121212",
                        inputType: TextInputType.phone,
                        inputFormatters: [AppConstants.phoneNumberFormat],
                        controller: whatsappNumberController,),
                        buildChatEnable(),
                        buildOrderEnable(),
                        buildSaveButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
