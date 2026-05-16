import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_checkbox.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/helper/route_helper.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class CompanyLoginWidget extends StatefulWidget {
  const CompanyLoginWidget({super.key});

  @override
  State<CompanyLoginWidget> createState() => _CompanyLoginWidgetState();
}

class _CompanyLoginWidgetState extends State<CompanyLoginWidget> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    final controller = Get.find<AuthenticationController>();
    if(AppConstants.demo){
      phoneController.text = "company@gmail.com";
      passwordController.text = "123456";
    }else{
      phoneController.text = controller.getEmail();
      passwordController.text = controller.getPassword();
      if(controller.getEmail().isNotEmpty){
        controller.toggleRememberMe(remember: true, notify: false);
      }
    }

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center, children: [

        Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Center(child: GetBuilder<AuthenticationController>(builder: (authenticationController) {

            return Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: Column(mainAxisSize: MainAxisSize.min, children: [

                Text("ready_to_hire_next_talent".tr, style: textBold.copyWith(fontSize: Dimensions.fontSizeHeading),),
                Text("create_or_sign_in".tr, style: textRegular.copyWith()),

                CustomTextField(title: "email".tr,
                  controller: phoneController,
                  prefixIcon: Images.email,
                    hintText: "email".tr),


                CustomTextField(
                  controller: passwordController,
                  title: "password".tr,hintText: "password".tr,
                  isPassword: true,
                  prefixIcon: Images.lock,
                  prefixIconSize: 20,
                  prefixIconColor: Theme.of(context).colorScheme.onSecondary),


                SizedBox(height: Dimensions.paddingSizeLarge,),
                Padding(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                  child: Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
                    CustomCheckbox(value: authenticationController.isActiveRememberMe,
                      onChange: () {
                      authenticationController.toggleRememberMe(
                          remember: !authenticationController.isActiveRememberMe);
                      },),

                    Expanded(child: Text("remember_me".tr,
                      style: textMedium.copyWith(color: Theme.of(context).hintColor),)),
                  ]),
                ),


                Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSize),
                  child: authenticationController.isLoading? const CircularProgressIndicator():
                  CustomButton(onTap: () {
                    String username = phoneController.text.trim();
                    String password = passwordController.text.trim();
                    if(username.isEmpty){
                      showCustomSnackBar("email_is_empty".tr);
                    }
                    else if(!GetUtils.isEmail(username)){
                      showCustomSnackBar("invalid_email".tr);
                    }
                    else if(password.isEmpty){
                      showCustomSnackBar("password_is_empty".tr);
                    }
                    else{
                      if(authenticationController.isActiveRememberMe){
                        authenticationController.saveEmailAndPassword(username, password);
                      }else{
                        authenticationController.clearUserEmailAndPassword();
                      }
                      authenticationController.login(username, password, fromDashboard: false);
                    }
                    }, text: "signIn".tr)),

                Row(
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(text: "dont_have_account".tr, style: textRegular),
                      TextSpan(text: " ", style: textRegular),
                      TextSpan(
                        text: "create_an_account".tr,
                        style: textSemiBold.copyWith(
                          fontSize: Dimensions.fontSizeLarge,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(RouteHelper.getCreateCompanyRoute(type: "create"));
                          },
                      ),

                    ])),
                  ],
                ),

                  ]),
                );
              }
          ),
          ),
        ),
      ],
    );
  }
}
