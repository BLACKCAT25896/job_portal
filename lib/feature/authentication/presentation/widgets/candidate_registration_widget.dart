import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_checkbox.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/authentication/domain/model/create_candidate_account_body.dart';
import 'package:mighty_job/feature/authentication/logic/authentication_controller.dart';
import 'package:mighty_job/feature/authentication/presentation/widgets/gender_selection_widget.dart';
import 'package:mighty_job/feature/frontend/policy_enum.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class CandidateRegistrationWidget extends StatefulWidget {
  const CandidateRegistrationWidget({super.key});

  @override
  State<CandidateRegistrationWidget> createState() => _CandidateRegistrationWidgetState();
}

class _CandidateRegistrationWidgetState extends State<CandidateRegistrationWidget> {

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return CustomContainer(verticalPadding: 50,
        horizontalPadding: 50,
        child: Column(spacing: Dimensions.paddingSizeDefault, children: [
      ResponsiveMasonryGrid(width: 400, children: [
        CustomTextField(title: "first_name".tr,
            controller: firstNameController,
            hintText: "first_name".tr),
        CustomTextField(title: "last_name".tr,
            controller: lastNameController,
            hintText: "last_name".tr),
        GenderSelectionWidget(),

        CustomTextField(title: "email".tr,
            controller: emailController,
            hintText: "email".tr),

        GetBuilder<AuthenticationController>(
          builder: (authenticationController) {
            return CustomTextField(
              isCodePicker: true,
              title: "phone".tr,
              hintText: 'phone'.tr,
              inputType: TextInputType.number,
              countryDialCode: authenticationController.countryDialCode,
              prefixHeight: 35,
              inputFormatters: [AppConstants.phoneNumberFormat],
              controller: phoneController,
              inputAction: TextInputAction.done,
              onCountryChanged: (CountryCode countryCode){
                authenticationController.countryDialCode = countryCode.dialCode!;
                authenticationController.setCountryCode(countryCode.dialCode!);
              },
            );
          }
        ),

        CustomTextField(title: "password".tr,
            controller: passwordController,
            isPassword: true,
            hintText: "password".tr),
        CustomTextField(title: "confirm_password".tr,
            controller: confirmPasswordController,
            isPassword: true,
            hintText: "confirm_password".tr),



      ]),
        GetBuilder<AuthenticationController>(
          builder: (controller) {
            return CustomCheckbox(
              onChange: (){
                controller.setAccept(!controller.isAccept);
              },
              value: controller.isAccept,
              titleWidget: Text.rich(
                TextSpan(children: [
                  TextSpan(text: "${"i_agree_with_the_terms_and_conditions".tr}. ",
                    style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyMedium!.color),),

                  TextSpan(text: "terms_and_condition".tr,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RouteHelper.getPolicyRoute(PolicyEnum.termsOfService));
                        },
                    style: textMedium.copyWith(color: systemPrimaryColor())),
                  ],
                ),
              ),
            );
          }
        ),
      GetBuilder<AuthenticationController>(
        builder: (controller) {
          return controller.isLoading?
              const Center(child: CircularProgressIndicator()) :
          CustomButton(
              onTap: controller.isAccept? (){

                String firstName = firstNameController.text.trim();
                String lastName = lastNameController.text.trim();
                String email = emailController.text.trim();
                String phone = phoneController.text.trim();
                String password = passwordController.text.trim();
                String confirmPassword = confirmPasswordController.text.trim();

                if(firstName.isEmpty) {
                  showCustomSnackBar("first_name_is_empty".tr);
                }else if(lastName.isEmpty) {
                  showCustomSnackBar("last_name_is_empty".tr);
                }else if(email.isEmpty) {
                  showCustomSnackBar("email_is_empty".tr);
                }else if(!GetUtils.isEmail(email)) {
                  showCustomSnackBar("invalid_email".tr);
                }else if(phone.isEmpty) {
                  showCustomSnackBar("phone_is_empty".tr);
                }else if(password.isEmpty) {
                  showCustomSnackBar("password_is_empty".tr);
                }else if(confirmPassword.isEmpty) {
                  showCustomSnackBar("confirm_password_is_empty".tr);
                }else if(password != confirmPassword) {
                  showCustomSnackBar("password_and_confirm_password_does_not_match".tr);
                  }else{
                  CreateCandidateAccountBody body = CreateCandidateAccountBody(
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    phone: phone,
                    password: password,
                    passwordConfirmation: confirmPassword,
                  );
                  controller.candidateRegistration(body);
                }



              } : null,
              text: "create_account".tr);
        }
      )


    ]));
  }
}
