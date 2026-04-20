import 'package:get/get.dart';
import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:mighty_job/helper/route_helper.dart';

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

];
