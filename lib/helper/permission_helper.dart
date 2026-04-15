import 'package:mighty_job/feature/profile/logic/profile_controller.dart';
import 'package:get/get.dart';

bool isPermitted(String permission) {
  return Get.find<ProfileController>().hasPermission(permission);
}
