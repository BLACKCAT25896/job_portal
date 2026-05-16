import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_munu_item.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/feature/profile/presentation/widgets/header_profile_info.dart';
import 'package:job/helper/route_helper.dart';


class HeaderProfileInfoMenu extends StatefulWidget {
  const HeaderProfileInfoMenu({super.key});

  @override
  State<HeaderProfileInfoMenu> createState() => _HeaderProfileInfoMenuState();
}

class _HeaderProfileInfoMenuState extends State<HeaderProfileInfoMenu> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(builder: (authenticationController) {
      String userType = authenticationController.getUserType();
      return GetBuilder<ProfileController>(builder: (profileController) {
        return Center(child: SimpleDropdownMenu(
          button: const HeaderProfileInfo(),
          backgroundColor: Theme.of(context).cardColor,
          items: userType == "Candidate"?[

          SimpleMenuItem(title: 'profile'.tr, icon: Icons.person_outline,
              onTap: () => Get.toNamed(RouteHelper.getCandidateProfileRoute())),


          SimpleMenuItem(title: 'applied_job'.tr, icon: Icons.work_outline,
              onTap: () => Get.toNamed(RouteHelper.getJobApplicationRoute())),


          SimpleMenuItem(title: 'logout'.tr, icon: Icons.exit_to_app,
            onTap: () {
              Get.find<AuthenticationController>().clearSharedData();
              Get.offAllNamed(RouteHelper.getSignInRoute());
            },
          ),
        ] :(userType == "Company" || userType == "Employer")?[
            SimpleMenuItem(title: 'billing'.tr, icon: Icons.payment_outlined,
                onTap: () => Get.toNamed(RouteHelper.getProfileRoute())),

            SimpleMenuItem(title: 'subscribed_services'.tr, icon: Icons.subscriptions_outlined,
                onTap: () => Get.toNamed(RouteHelper.getProfileRoute())),

            SimpleMenuItem(title: 'edit_account'.tr, icon: Icons.edit_outlined,
                onTap: () => Get.toNamed(RouteHelper.getCreateCompanyRoute(type: "edit"))),


            SimpleMenuItem(title: 'support'.tr, icon: Icons.support_agent,
                onTap: () => Get.toNamed(RouteHelper.getProfileRoute())),

            SimpleMenuItem(title: 'settings'.tr, icon: Icons.settings_outlined,
                onTap: () => Get.toNamed(RouteHelper.getProfileRoute())),


            SimpleMenuItem(title: 'change_password'.tr, icon: Icons.lock_outline,
                onTap: () => Get.toNamed(RouteHelper.getUserChangePasswordRoute())),

            SimpleMenuItem(title: 'user_management'.tr, icon: Icons.manage_accounts_outlined,
                onTap: () => Get.toNamed(RouteHelper.getCompanyUsersRoute())),

            SimpleMenuItem(title: 'logout'.tr, icon: Icons.logout,
                onTap: () {
                  Get.find<AuthenticationController>().clearSharedData();
                  Get.offAllNamed(RouteHelper.getSignInRoute());
                }),
          ]:[

            SimpleMenuItem(title: 'dashboard'.tr, icon: Icons.dashboard,
                onTap: () => Get.toNamed(RouteHelper.getDashboardRoute())),

            SimpleMenuItem(title: 'profile'.tr, icon: Icons.person_outline,
                onTap: () => Get.toNamed(RouteHelper.getProfileRoute())),

            SimpleMenuItem(title: 'change_password'.tr, icon: Icons.lock_outline,
                onTap: () => Get.toNamed(RouteHelper.getChangePasswordRoute())),

            SimpleMenuItem(title: 'logout'.tr, icon: Icons.logout,
                onTap: () {
                  Get.find<AuthenticationController>().clearSharedData();
                  Get.offAllNamed(RouteHelper.getSignInRoute());
                }),
          ],
        ),
        );
      }
      );
    }
    );
  }
}
