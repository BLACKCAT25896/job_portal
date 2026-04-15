import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_checkbox.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/authentication/logic/authentication_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

class LoginWidget extends StatefulWidget {
  final bool fromDashboard;
  const LoginWidget({super.key,  this.fromDashboard = false});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    final controller = Get.find<AuthenticationController>();
    if(AppConstants.demo){
      phoneController.text = "00000000001";
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
    return Column(mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Center(child: GetBuilder<AuthenticationController>(
              builder: (authenticationController) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [

                    Text("welcome_back".tr, style: textBold.copyWith(
                        fontSize: Dimensions.fontSizeLarge),),

                    CustomTextField(title: "email".tr,
                      controller: phoneController,
                      prefixIcon: Images.email,
                      hintText: "enter_phone".tr,
                    ),


                    CustomTextField(
                        controller: passwordController,
                        title: "password".tr,hintText: "password".tr,
                        isPassword: true,
                        prefixIcon: Images.lock,
                        prefixIconSize: 20,
                        prefixIconColor: Theme.of(context).colorScheme.onSecondary,
                        ),

                    const SizedBox(height: Dimensions.paddingSizeLarge,),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
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


                    Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSize),
                      child: authenticationController.isLoading? const CircularProgressIndicator():
                      CustomButton(onTap: () {
                        String username = phoneController.text.trim();
                        String password = passwordController.text.trim();
                        if(username.isEmpty){
                          showCustomSnackBar("phone_is_empty".tr);
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
                          authenticationController.login(username, password,
                              fromDashboard: widget.fromDashboard);
                        }
                      },
                        text: "signIn".tr,),
                    ),


                    if(AppConstants.demo)
                    MasonryGridView.builder(
                      gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: Dimensions.paddingSizeSmall,
                      crossAxisSpacing: Dimensions.paddingSizeSmall,
                      padding: EdgeInsets.zero,
                      itemCount: authenticationController.roles.length,
                      itemBuilder: (context, index) {
                        final text = authenticationController.roles[index];
                      return IntrinsicWidth(child: CustomButton(
                        buttonColor: index == authenticationController.selectedRoleIndex?
                        systemPrimaryColor(): Theme.of(context).hintColor,
                          textColor: index == authenticationController.selectedRoleIndex?
                          Colors.white: Theme.of(context).textTheme.displayMedium!.color!,
                          onTap: (){
                        authenticationController.setSelectedRoleIndex(index);
                        if(index == 0){
                          phoneController.text = "00000000001";
                          passwordController.text = "123456";
                        }else if(index == 1){
                          phoneController.text = "manager1@gmail.com";
                          passwordController.text = "123456";
                        }else if(index == 2){
                          phoneController.text = "employee1@gmail.com";
                          passwordController.text = "123456";
                        }
                      }, text: text));
                      },)


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
