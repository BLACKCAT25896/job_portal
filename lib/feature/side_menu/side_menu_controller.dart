
import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/feature/support_ticket/widgets/add_ticket_widget.dart';
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



    SideMenuNestedExpansionItem(sectionTitle: "product_management".tr,
      title: "category_setup".tr, keyValue: "category_setup",parent: true,
      icon: Images.manageOrder, children: [

        SideMenuItemWidget(title: 'category'.tr, keyValue: 'category',
            onTap: () => Get.toNamed(RouteHelper.getCategoryRoute())),

      SideMenuItemWidget(title: 'add_new_category'.tr, keyValue: 'add_new_category',
          onTap: () => Get.toNamed(RouteHelper.getAddNewCategoryRoute())),

    ],
    ),

    SideMenuNestedExpansionItem(
      title: "brand_setup".tr, keyValue: "brand_setup",parent: true,
      icon: Images.manageOrder, children: [

      SideMenuItemWidget(title: 'brand'.tr, keyValue: 'brand',
          onTap: () => Get.toNamed(RouteHelper.getBrandRoute())),

      SideMenuItemWidget(title: 'add_new_brand'.tr, keyValue: 'add_new_brand',
          onTap: () => Get.toNamed(RouteHelper.getAddNewBrandRoute())),

    ],
    ),





    if(profileController.hasPermission("banners_index"))
    SideMenuNestedExpansionItem(title: "website_setup".tr, keyValue: "website_setup",
      parent: true, icon: Images.websiteSetup,
      children: [
        if(profileController.hasPermission("banners_index"))
        SideMenuItemWidget(title: 'banner'.tr, keyValue: 'banner',
          onTap: () => Get.toNamed(RouteHelper.getBannerRoute())),

        if(profileController.hasPermission("about_us_index"))
        SideMenuItemWidget(title: 'about_us'.tr, keyValue: 'about_us',
          onTap: () => Get.toNamed(RouteHelper.getAboutUsRoute())),

        if(profileController.hasPermission("why_choose_us_index"))
        SideMenuItemWidget(title: 'why_choose_us'.tr, keyValue: 'why_choose_us',
          onTap: () => Get.toNamed(RouteHelper.getWhyChooseUsRoute())),

        if(profileController.hasPermission("faqs_index"))
        SideMenuItemWidget(title: 'faq'.tr, keyValue: 'faq',
          onTap: () => Get.toNamed(RouteHelper.getFaqRoute())),

        if(profileController.hasPermission("feedbacks_index"))
        SideMenuItemWidget(title: 'feedback'.tr, keyValue: 'feedback',
          onTap: () => Get.toNamed(RouteHelper.getFeedbackRoute())),

        if(profileController.hasPermission("banners_index"))
        SideMenuItemWidget(title: 'website_settings'.tr, keyValue: 'website_settings',
            onTap: () => Get.toNamed(RouteHelper.getWebsiteSettingRoute())),

        if(profileController.hasPermission("policies_index"))
        SideMenuItemWidget(title: 'pages'.tr, keyValue: 'pages',
            onTap: () => Get.toNamed(RouteHelper.getPagesRoute())),
      ],
    ),

    SideMenuNestedExpansionItem(title: "message".tr, keyValue: "message",
      parent: true, icon: Images.message,
      children: [
        SideMenuItemWidget(title: 'new_message'.tr, keyValue: 'new_message',
          onTap: () => Get.dialog(CustomDialogWidget(title: "message".tr,
              child: AddTicketWidget()))),

        SideMenuItemWidget(title: 'inbox'.tr, keyValue: 'inbox',
            onTap: () => Get.toNamed(RouteHelper.getSupportTicketRoute())),

        SideMenuItemWidget(title: 'ticket_category'.tr, keyValue: 'ticket_category',
            onTap: () => Get.toNamed(RouteHelper.getSupportTicketCategoryRoute())),




      ],
    ),


    if(profileController.hasPermission("user_index"))
    SideMenuNestedExpansionItem(title: "user".tr, keyValue: "user",
      parent: true, icon: Images.user, children: [
        SideMenuItemWidget(title: 'user'.tr, keyValue: 'user',
            onTap: () => Get.toNamed(RouteHelper.getUsersRoute())),


      ],
    ),

    if(profileController.hasPermission("user_index"))
      SideMenuNestedExpansionItem(title: "customer".tr, keyValue: "customer",
        parent: true, icon: Images.user, children: [
          SideMenuItemWidget(title: 'customer'.tr, keyValue: 'customer',
              onTap: () => Get.toNamed(RouteHelper.getCustomerRoute())),


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
    SideMenuNestedExpansionItem(title: "tax_settings".tr, keyValue: "tax_settings",
      parent: true, icon: Images.taxSetting, children: [
        SideMenuItemWidget(title: 'tax_settings'.tr, keyValue: 'tax_settings',
          onTap: () => Get.toNamed(RouteHelper.getTaxSettingRoute())),

      ]),



    if(profileController.hasPermission("settings_index"))
    SideMenuNestedExpansionItem(title: "whatsapp_setting".tr, keyValue: "whatsapp_setting",
      parent: true, icon: Images.whatsappSvgIcon, children: [
        SideMenuItemWidget(title: 'whatsapp_setting'.tr, keyValue: 'whatsapp_setting',
          onTap: ()=> Get.toNamed(RouteHelper.getWhatsappSettingRoute())),
      ],
    ),

    if(profileController.hasPermission("settings_index"))
    SideMenuNestedExpansionItem(title: "facebook_setting".tr, keyValue: "facebook_setting",
      parent: true, icon: Images.facebook, children: [
        SideMenuItemWidget(title: 'facebook_setting'.tr, keyValue: 'facebook_setting',
          onTap: () => Get.toNamed(RouteHelper.getFacebookSettingRoute())),
      ],),


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