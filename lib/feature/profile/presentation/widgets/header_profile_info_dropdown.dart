import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_munu_item.dart';
import 'package:mighty_job/feature/authentication/logic/authentication_controller.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:mighty_job/feature/profile/presentation/widgets/header_profile_info.dart';
import 'package:mighty_job/helper/route_helper.dart';


class HeaderProfileInfoMenu extends StatefulWidget {
  const HeaderProfileInfoMenu({super.key});

  @override
  State<HeaderProfileInfoMenu> createState() => _HeaderProfileInfoMenuState();
}

class _HeaderProfileInfoMenuState extends State<HeaderProfileInfoMenu> {
  @override
  void initState() {
    if(Get.find<ProfileController>().profileModel == null) {
      Get.find<ProfileController>().getProfileInfo();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(builder: (authenticationController) {
      return GetBuilder<ProfileController>(builder: (profileController) {
        return Center(child: SimpleDropdownMenu(
          button: const HeaderProfileInfo(),
          backgroundColor: Theme.of(context).cardColor, items: [

          SimpleMenuItem(title: 'profile'.tr, icon: Icons.person,
              onTap: () => Get.toNamed(RouteHelper.getProfileRoute())),

          SimpleMenuItem(title: 'email_cv'.tr, icon: Icons.dashboard,
              onTap: () => Get.toNamed(RouteHelper.getDashboardRoute())),

          SimpleMenuItem(title: 'personal_hiring'.tr, icon: Icons.dashboard,
              onTap: () => Get.toNamed(RouteHelper.getDashboardRoute())),

          SimpleMenuItem(title: 'saved_job'.tr, icon: Icons.dashboard,
              onTap: () => Get.toNamed(RouteHelper.getDashboardRoute())),

          SimpleMenuItem(title: 'following_employer'.tr, icon: Icons.dashboard,
              onTap: () => Get.toNamed(RouteHelper.getDashboardRoute())),

          SimpleMenuItem(title: 'applied_job'.tr, icon: Icons.dashboard,
              onTap: () => Get.toNamed(RouteHelper.getDashboardRoute())),


          SimpleMenuItem(title: 'logout'.tr, icon: Icons.exit_to_app,
            onTap: () {
              Get.find<AuthenticationController>().clearSharedData();
              Get.offAllNamed(RouteHelper.getSignInRoute());
            },
          ),
        ],
        ),
        );
      }
      );
    }
    );
  }
}
