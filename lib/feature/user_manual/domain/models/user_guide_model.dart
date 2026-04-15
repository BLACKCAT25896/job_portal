import 'package:get/get.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/helper/route_helper.dart';

class UserGuideItem {
  final String routeName;
  final String title;
  final String description;

  UserGuideItem({required this.routeName, required this.title, required this.description});
}

final ProfileController profileController = Get.find<ProfileController>();

List<UserGuideItem> userGuideItems = [

  if(profileController.hasPermission("dashboard"))
    UserGuideItem(
      routeName: RouteHelper.getDashboardRoute(),
      title: 'dashboard'.tr,
      description: 'Navigate to ${"dashboard".tr} to view the dashboard.',
    ),

  if(profileController.hasPermission("user_index"))
    UserGuideItem(
      routeName: RouteHelper.getProfileRoute(),
      title: 'profile'.tr,
      description: 'Navigate to ${"profile".tr} to view and edit your profile.',
    ),

  if(profileController.hasPermission("notification"))
    UserGuideItem(
      routeName: RouteHelper.getNotificationRoute(),
      title: 'notification'.tr,
      description: 'Navigate to ${"notification".tr} to view system notifications.',
    ),

  // CMS Management
  if(profileController.hasPermission("about_us_index"))
    UserGuideItem(
      routeName: RouteHelper.getAboutUsRoute(),
      title: 'about_us'.tr,
      description: 'Navigate to ${"about_us".tr} to manage about us page.',
    ),

  if(profileController.hasPermission("banners_index"))
    UserGuideItem(
      routeName: RouteHelper.getBannerRoute(),
      title: 'banner'.tr,
      description: 'Navigate to ${"banner".tr} to manage banners.',
    ),

  if(profileController.hasPermission("cms.explore"))
    UserGuideItem(
      routeName: RouteHelper.getExploreRoute(),
      title: 'explore'.tr,
      description: 'Navigate to ${"explore".tr} to manage explore content.',
    ),

  if(profileController.hasPermission("faqs_index"))
    UserGuideItem(
      routeName: RouteHelper.getFaqRoute(),
      title: 'faq'.tr,
      description: 'Navigate to ${"faq".tr} to manage frequently asked questions.',
    ),

  if(profileController.hasPermission("why_choose_us_index"))
    UserGuideItem(
      routeName: RouteHelper.getWhyChooseUsRoute(),
      title: 'why_choose_us'.tr,
      description: 'Navigate to ${"why_choose_us".tr} to manage conceptual video content.',
    ),

  if(profileController.hasPermission("feedbacks_index"))
    UserGuideItem(
      routeName: RouteHelper.getFeedbackRoute(),
      title: 'feedback'.tr,
      description: 'Navigate to ${"feedback".tr} to view user feedback.',
    ),



  // Accounting
  if(profileController.hasPermission("accounting.deposit"))
    UserGuideItem(
      routeName: RouteHelper.getDepositRoute(),
      title: 'deposit'.tr,
      description: 'Navigate to ${"deposit".tr} to manage deposits.',
    ),

  if(profileController.hasPermission("accounting.deposit_category"))
    UserGuideItem(
      routeName: RouteHelper.getDepositCategoryRoute(),
      title: 'deposit_category'.tr,
      description: 'Navigate to ${"deposit_category".tr} to manage deposit categories.',
    ),

  if(profileController.hasPermission("accounting.expense"))
    UserGuideItem(
      routeName: RouteHelper.getExpenseRoute(),
      title: 'expense'.tr,
      description: 'Navigate to ${"expense".tr} to manage expenses.',
    ),

  if(profileController.hasPermission("accounting.expense_category"))
    UserGuideItem(
      routeName: RouteHelper.getExpenseCategoryRoute(),
      title: 'expense_category'.tr,
      description: 'Navigate to ${"expense_category".tr} to manage expense categories.',
    ),

  if(profileController.hasPermission("accounting.fund"))
    UserGuideItem(
      routeName: RouteHelper.getFundRoute(),
      title: 'fund'.tr,
      description: 'Navigate to ${"fund".tr} to manage funds.',
    ),


  // HRM Example
  if(profileController.hasPermission("hrm.department"))
    UserGuideItem(
      routeName: RouteHelper.getDepartmentRoute(),
      title: 'department'.tr,
      description: 'Navigate to ${"department".tr} to manage departments.',
    ),

  if(profileController.hasPermission("hrm.designation"))
    UserGuideItem(
      routeName: RouteHelper.getDesignationRoute(),
      title: 'designation'.tr,
      description: 'Navigate to ${"designation".tr} to manage designations.',
    ),

  if(profileController.hasPermission("hrm.employee"))
    UserGuideItem(
      routeName: RouteHelper.getEmployeeRoute(),
      title: 'employee'.tr,
      description: 'Navigate to ${"employee".tr} to manage employees.',
    ),

  // Add more items similarly for other modules (loyalty, purchase, reservation, reports, etc.)

];
