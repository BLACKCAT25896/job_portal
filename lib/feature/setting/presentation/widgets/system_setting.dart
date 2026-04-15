import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/setting/logic/setting_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class SystemSetting extends StatelessWidget {
  const SystemSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "system_setting".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: GetBuilder<SettingController>(builder: (settingController) {
          return Column(children: [
            SectionHeaderWithPath(sectionTitle: 'general_settings'.tr, pathItems: ["system_setting".tr],),
            Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: CustomContainer(showShadow: false, borderRadius: 5,
                  child: Row(children: [
                    Expanded(child: Text("clear_cache".tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge))),
                    IntrinsicWidth(child: settingController.isLoading?
                      CircularProgressIndicator():
                  CustomButton(width: 100, onTap: () async {
                    await settingController.storageUnLink().then((val) async {
                      await settingController.storageLink().then((val){
                        settingController.clearCache();
                      });
                    });

                  }, text: "clear".tr))
                ],
                    )),
              )
            ]);
          }
        ))
      ]),
    );
  }
}
