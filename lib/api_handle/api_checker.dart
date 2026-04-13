
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/authentication/logic/authentication_controller.dart';
import 'package:ecommerce/feature/authentication/presentation/screen/login_screen.dart';


class ApiChecker {
  static Future<void> checkApi(Response response) async {
    if (response.statusCode == 401) {
      Get.find<AuthenticationController>().clearSharedData();
      Get.offAll(() => const LoginScreen());
    } else {
      if (response.body != null && response.body['message'] != null) {
        showCustomSnackBar(response.body['message']!);
      }
    }
  }
}
