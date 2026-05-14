
import 'package:get/get.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/helper/route_helper.dart';


class ApiChecker {
  static Future<void> checkApi(Response response) async {
    if (response.statusCode == 401) {
      Get.find<AuthenticationController>().clearSharedData();
      Get.offAllNamed(RouteHelper.getLoginRoute());
    } else {
      if (response.body != null && response.body['message'] != null) {
        showCustomSnackBar(response.body['message']!);
      }
    }
  }
}
