
import 'package:mighty_job/common/widget/custom_checkbox.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';

class FacebookSetting extends StatefulWidget {
  const FacebookSetting({super.key});

  @override
  State<FacebookSetting> createState() => _FacebookSettingState();
}

class _FacebookSettingState extends State<FacebookSetting> {
  TextEditingController pixelCodeController = TextEditingController();
  TextEditingController facebookChatUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(Get.find<SystemSettingsController>().generalSettingModel != null){
      facebookChatUrlController.text = Get.find<SystemSettingsController>().generalSettingModel?.data?.facebookLink ?? "";
      pixelCodeController.text = Get.find<SystemSettingsController>().generalSettingModel?.data?.facebookLink ?? "";

    }

  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Scaffold(appBar: CustomAppBar(title: "facebook_setting".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: GetBuilder<SystemSettingsController>(
          builder: (controller) {
            return Column(children: [
              SizedBox(height: isDesktop ? 0 : Dimensions.paddingSizeDefault),
              SectionHeaderWithPath(sectionTitle: "facebook_setting".tr),
              Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: CustomContainer(showShadow: false, borderRadius: 5,
                  child: Column(spacing: Dimensions.paddingSizeDefault,
                    crossAxisAlignment: CrossAxisAlignment.end, children: [
                    CustomTextField(title: "pixel_code".tr, hintText: "pixel_code".tr,
                      controller: pixelCodeController,),

                    CustomTextField(title: "chat_url".tr,
                      hintText: "chat_url",
                      controller: facebookChatUrlController,),

                    CustomCheckbox(value: controller.faceBookChatEnable,
                    title: "chat_enable".tr,
                      onChange: ()=> controller.setFacebookChatEnable(!controller.faceBookChatEnable),),


                    SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                      controller.loading? Center(child: CircularProgressIndicator()):
                      CustomButton(onTap: (){
                        String pixelCode = pixelCodeController.text.trim();
                        String url = facebookChatUrlController.text.trim();
                        int chatEnable = controller.faceBookChatEnable?1:0;
                        if(pixelCode.isEmpty){
                          showCustomSnackBar("pixel_code_empty".tr);
                        }else if(url.isNotEmpty){
                          showCustomSnackBar("chat_url_empty".tr);
                        }else{
                          controller.facebookSetting(pixelCode, chatEnable, url);
                        }

                      }, text: "confirm".tr)
                  ],
                  ),
                ),
              ),

            ],
            );
          }
        ),
        )
      ],
      ),
    );
  }
}
