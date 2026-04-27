
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/frontend_custom_button.dart';
import 'package:mighty_job/feature/authentication/logic/authentication_controller.dart';
import 'package:mighty_job/feature/profile/presentation/widgets/header_profile_info_dropdown.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/dimensions.dart';

class LoginOptionWidget extends StatelessWidget {
  const LoginOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(builder: (authenticationController) {
      return authenticationController.isLoggedIn()?
      const HeaderProfileInfoMenu():
      Row(spacing: Dimensions.paddingSizeDefault, children: [
          IntrinsicWidth(child: FrontendCustomButton(
            textColor: systemPrimaryColor(),
            buttonColor: Theme.of(context).cardColor,
              borderColor: systemPrimaryColor(),
              borderWidth: 1,
              height: 35, onTap: (){

          }, text: "create_account".tr)),

        IntrinsicWidth(child: FrontendCustomButton(
            buttonColor: systemPrimaryColor(),
            height: 35, onTap: (){
          Get.toNamed(RouteHelper.getLoginRoute());
        }, text: "login".tr)),
        ],
      );
    });
  }
}
