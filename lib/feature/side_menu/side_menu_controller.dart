
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/side_menu/src/side_menu_item_widget.dart';
import 'package:mighty_job/common/widget/side_menu/src/side_menu_nested_expension_item.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/images.dart';

class SideBarController extends GetxController implements GetxService{


  late final List<dynamic> allMenuItems;
  List<dynamic> sideMenuItems = [];

  @override
  void onInit() {
    allMenuItems = _buildSideSideMenuTypes();
    sideMenuItems = List.from(allMenuItems);
    Get.find<SystemSettingsController>().getGeneralSetting();
    super.onInit();
  }

  void refreshMenus() {
    allMenuItems.clear();
    allMenuItems.addAll(_buildSideSideMenuTypes());
    sideMenuItems = List.from(allMenuItems);
    update();
  }


  void filterMenu(String query) {
    final q = query.trim().toLowerCase();

    if (q.isEmpty) {
      sideMenuItems = List.from(allMenuItems);
    } else {
      sideMenuItems = allMenuItems.map((item) {
        if (item is SideMenuNestedExpansionItem) {
          final List<Widget> matchedChildren = item.children
              ?.where((child) =>
              _getItemTitle(child).contains(q))
              .toList() ??
              [];

          if (matchedChildren.isNotEmpty) {
            return SideMenuNestedExpansionItem(
              keyValue: item.keyValue,
              title: item.title,
              icon: item.icon,
              parent: item.parent,
              onTap: item.onTap,
              sectionTitle: item.sectionTitle,
              children: matchedChildren,
            );
          }
          if (_getItemTitle(item).contains(q)) return item;

          return null;
        }
        return _getItemTitle(item).contains(q) ? item : null;
      }).whereType<SideMenuNestedExpansionItem>().toList();
    }
    update();
  }


  String _getItemTitle(dynamic item) {
    if (item is SideMenuItemWidget) return item.title.toLowerCase();
    if (item is SideMenuNestedExpansionItem) return item.title.toLowerCase();
    return "";
  }


  bool isExpanded = true;
  void toggleSideMenu() {
    isExpanded = !isExpanded;
    update();
  }

  final ProfileController profileController = Get.find<ProfileController>();
  List<dynamic> _buildSideSideMenuTypes() { return  [


    if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "dashboard".tr, keyValue: "dashboard", parent: true,
      icon: Images.dashboardSvgIcon,onTap: () => Get.toNamed(RouteHelper.getDashboardRoute()),),


    // if(profileController.hasPermission("dashboard"))
      SideMenuNestedExpansionItem(title: "industry".tr, keyValue: "industry", parent: true,
        icon: Images.dashboardSvgIcon,
        onTap: () => Get.toNamed(RouteHelper.getIndustryRoute()),),

    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "company_size".tr, keyValue: "company_size", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getCompanySizeRoute()),),


    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "ownership_type".tr, keyValue: "ownership_type", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getOwnershipTypeRoute()),),


    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "company".tr, keyValue: "company", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getCompanyRoute()),),


    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "career_level".tr, keyValue: "career_level", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getCareerLevelRoute()),),


    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "salary_currency".tr, keyValue: "salary_currency", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getSalaryCurrencyRoute()),),


    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "salary_period".tr, keyValue: "salary_period", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getSalaryPeriodRoute()),),

    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "skill".tr, keyValue: "skill", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getSkillRoute()),),

    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "job_category".tr, keyValue: "job_category", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getJobCategoryRoute()),),

    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "job_listing".tr, keyValue: "job_listing", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getJobListingRoute()),),

    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "job_stage".tr, keyValue: "job_stage", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getJobStageRoute()),),


    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "job_application".tr, keyValue: "job_application", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getJobApplicationRoute()),),


    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "candidate".tr, keyValue: "candidate", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getCandidateRoute()),),


    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "candidate_education".tr, keyValue: "candidate_education", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getCandidateEducationRoute()),),


    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "candidate_experience".tr, keyValue: "candidate_experience", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getCandidateExperienceRoute()),),


    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "candidate_resume".tr, keyValue: "candidate_resume", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getCandidateResumeRoute()),),

    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "inquiry".tr, keyValue: "inquiry", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getInquiryRoute()),),

    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "post_category".tr, keyValue: "post_category", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getPostCategoryRoute()),),

    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "post".tr, keyValue: "post", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getPostRoute()),),

    // if(profileController.hasPermission("dashboard"))
    SideMenuNestedExpansionItem(title: "transaction".tr, keyValue: "transaction", parent: true,
      icon: Images.dashboardSvgIcon,
      onTap: () => Get.toNamed(RouteHelper.getTransactionRoute()),),



    if(profileController.hasPermission("banners_index"))
    SideMenuNestedExpansionItem(title: "website_setup".tr, keyValue: "website_setup",
      parent: true, icon: Images.websiteSetup, children: [

        if(profileController.hasPermission("banners_index"))
        SideMenuItemWidget(title: 'website_settings'.tr, keyValue: 'website_settings',
            onTap: () => Get.toNamed(RouteHelper.getWebsiteSettingRoute())),

        if(profileController.hasPermission("policies_index"))
        SideMenuItemWidget(title: 'pages'.tr, keyValue: 'pages',
            onTap: () => Get.toNamed(RouteHelper.getPagesRoute())),
      ],
    ),

    // SideMenuNestedExpansionItem(title: "message".tr, keyValue: "message",
    //   parent: true, icon: Images.message,
    //   children: [
    //     SideMenuItemWidget(title: 'new_message'.tr, keyValue: 'new_message',
    //       onTap: () => Get.dialog(CustomDialogWidget(title: "message".tr,
    //           child: AddTicketWidget()))),
    //
    //     SideMenuItemWidget(title: 'inbox'.tr, keyValue: 'inbox',
    //         onTap: () => Get.toNamed(RouteHelper.getSupportTicketRoute())),
    //
    //     SideMenuItemWidget(title: 'ticket_category'.tr, keyValue: 'ticket_category',
    //         onTap: () => Get.toNamed(RouteHelper.getSupportTicketCategoryRoute())),
    //
    //
    //
    //
    //   ],
    // ),


    if(profileController.hasPermission("user_index"))
    SideMenuNestedExpansionItem(title: "user".tr, keyValue: "user",
      parent: true, icon: Images.user, children: [
        SideMenuItemWidget(title: 'user'.tr, keyValue: 'user',
            onTap: () => Get.toNamed(RouteHelper.getUsersRoute())),


      ],
    ),



    if(profileController.hasPermission("role_index"))
    SideMenuNestedExpansionItem(title: "roles_and_permissions".tr, keyValue: "roles_and_permissions",
      parent: true, icon: Images.role, children: [

        SideMenuItemWidget(title: 'admin_roles_and_permissions'.tr, keyValue: 'roles_admin_roles',
          onTap: () => Get.toNamed(RouteHelper.getRolesRoute())),



      ],
    ),




    if(profileController.hasPermission("settings_index"))
    SideMenuNestedExpansionItem(title: "general_settings".tr, keyValue: "general_settings",
      parent: true, icon: Images.setting, children: [

        SideMenuItemWidget(title: 'payment_method'.tr, keyValue: 'payment_method',
            onTap: () => Get.toNamed(RouteHelper.getPaymentMethodRoute())),


        SideMenuItemWidget(title: 'system_setting'.tr, keyValue: 'system_setting',
            onTap: () => Get.toNamed(RouteHelper.getSystemSettingRoute())),
      ],
    ),

  ];}

}