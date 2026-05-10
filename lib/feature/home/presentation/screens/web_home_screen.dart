import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:job/feature/home/presentation/widget/admin_dashboard_section.dart';
import 'package:job/feature/home/presentation/widget/candidate_dashboard_section.dart';
import 'package:job/feature/home/presentation/widget/company_dashboard_section.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';


class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({super.key});

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Get.find<SystemSettingsController>().getGeneralSetting();
    if(Get.find<ProfileController>().profileModel == null){
      Get.find<ProfileController>().getProfileInfo();
    }
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "dashboard".tr),
      body: GetBuilder<AuthenticationController>(
        builder: (controller) {
          final userType = controller.getUserType();
          return userType == "Super Admin"?
          AdminDashboardSection(scrollController: scrollController):
          userType == "Company"?
          CompanyDashboardSection(): CandidateDashboardSection();
        }
      ),
    );
  }
}
