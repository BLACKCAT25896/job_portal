
import 'package:mighty_job/feature/cms_management/cms_settings/presentation/widgets/available_theme_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_route_path_widget.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/presentation/widgets/general_settings_widget.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/presentation/widgets/select_logo_widget.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/presentation/widgets/system_settings_heading_section_widget.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/presentation/widgets/theme_manage_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SystemSettingScreen extends StatefulWidget {
  const SystemSettingScreen({super.key});

  @override
  State<SystemSettingScreen> createState() => _SystemSettingScreenState();
}

class _SystemSettingScreenState extends State<SystemSettingScreen> {
  @override
  void initState() {
  loadData();
    super.initState();
  }

  Future<void> loadData()async {
    if(Get.find<SystemSettingsController>().generalSettingModel == null){
      await Get.find<SystemSettingsController>().getGeneralSetting();
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: "system_setting".tr),
      body: CustomWebScrollView(slivers: [

         SliverToBoxAdapter(child: GetBuilder<SystemSettingsController>(
           builder: (systemSettingsController) {

             return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

              Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: CustomRoutePathWidget(title: "master_configuration".tr)),
              const SystemSettingsHeadingSectionWidget(),

               if(systemSettingsController.settingsTypeIndex == 0)
              const GeneralSettingsWidget(),

               if(systemSettingsController.settingsTypeIndex == 1)
                 const SelectLogoWidget(),

               if(systemSettingsController.settingsTypeIndex == 2)
                 ThemeManageWidget(),
               if(systemSettingsController.settingsTypeIndex == 3)
                 AvailableThemeList(),


             ],);
           }
         ),)
      ],),
    );
  }
}
