import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_checkbox.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/authentication/domain/model/create_company_account_body.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/authentication/presentation/widgets/captcha_verification.dart';
import 'package:job/feature/authentication/presentation/widgets/employee_number_selection_widget.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/frontend/presentation/widgets/industry/select_public_industry_widget.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';
import 'package:get/get.dart';

class CompanyRegistrationWidget extends StatefulWidget {
  const CompanyRegistrationWidget({super.key});

  @override
  State<CompanyRegistrationWidget> createState() => _CompanyRegistrationWidgetState();
}

class _CompanyRegistrationWidgetState extends State<CompanyRegistrationWidget> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController companyNameController = TextEditingController();
  TextEditingController establishedInController = TextEditingController();
  TextEditingController companyDetailsController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController businessDescriptionController = TextEditingController();
  TextEditingController tradeLicenceNoController = TextEditingController();
  TextEditingController rlNoController = TextEditingController();
  TextEditingController websiteUrlController = TextEditingController();
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController contactPersonDesignationController = TextEditingController();
  TextEditingController contactPersonEmailController = TextEditingController();
  TextEditingController contactPersonPhoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Dimensions.paddingSizeDefault,
        children: [
      CustomContainer(showShadow: false, borderRadius: 5,
          verticalPadding: 20,horizontalPadding: Dimensions.paddingSizeDefault,
          color: systemPrimaryColor(),
          child: Row(spacing: Dimensions.paddingSizeDefault, children: [
        
        CustomContainer(color: Colors.white,
            child: CustomImage(width: 100, image: Images.company, isLocalAsset: true, svgColor: systemPrimaryColor(),)),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimensions.paddingSizeSmall,
              children: [
            Text("employee_registration_form".tr,
                style: textSemiBold.copyWith(
                  color: Colors.white,
                    fontSize: Dimensions.fontSizeExtraLarge)),

            Text("create_your_account_to_reach_top_talent_and_streamline_hiring".tr,
                style: textRegular.copyWith(color: Colors.white))
          ]),
        ),
        Text.rich(TextSpan(children: [
          TextSpan(text: "over".tr, style: textMedium.copyWith(
              color: Colors.white,
              fontSize: Dimensions.fontSizeLarge)),
          TextSpan(text: " ".tr),
          TextSpan(text: "45000+".tr, style: textSemiBold.copyWith(color: Colors.white,
              fontSize: Dimensions.fontSizeExtraLarge)),
          TextSpan(text: " ".tr),
          TextSpan(text: "companies_trusted_us".tr,  style: textMedium.copyWith(
              color: Colors.white,
              fontSize: Dimensions.fontSizeLarge)),
        ]))
        
      ])),

      CustomContainer(
        horizontalPadding: Dimensions.paddingSizeLarge,
          verticalPadding: Dimensions.paddingSizeLarge,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: Dimensions.paddingSizeLarge),
        Text("user_information".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
        ResponsiveMasonryGrid(children: [
          CustomTextField(title: "username".tr,
            controller: userNameController,
            hintText: "username".tr),

          CustomTextField(title: "password".tr,
            controller: passwordController,
            hintText: "password".tr,
            isPassword: true),

          CustomTextField(title: "confirm_password".tr,
            controller: confirmPasswordController,
            hintText: "confirm_password".tr,
            isPassword: true),

        ]),

        SizedBox(height: Dimensions.paddingSizeLarge),
        Text("company_information".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

        ResponsiveMasonryGrid(children: [
          CustomTextField(title: "company_name".tr,
            controller: companyNameController,
            hintText: "company_name".tr),

          CustomTextField(title: "established_in".tr,
            controller: establishedInController,
            hintText: "established_in".tr),

          CustomTextField(title: "company_address".tr,
            controller: companyAddressController,
            hintText: "company_address".tr),

        ]),

            EmployeeNumberSelectionWidget(),

        CustomTextField(
          title: "company_details".tr,
          controller: companyDetailsController,
          hintText: "company_details".tr,
          minLines: 3,
          maxLines: 5,
          inputAction: TextInputAction.newline,
          inputType: TextInputType.multiline,
        ),

            SizedBox(height: Dimensions.paddingSizeLarge),
            Text("industry_type".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

            SelectPublicIndustryWidget(),

        CustomTextField(
          title: "business_description".tr,
          controller: businessDescriptionController,
          hintText: "business_description".tr,
          minLines: 3,
          maxLines: 5,
          inputAction: TextInputAction.newline,
          inputType: TextInputType.multiline,
        ),

        ResponsiveMasonryGrid(children: [
          CustomTextField(
            title: "trade_licence_no".tr,
            controller: tradeLicenceNoController,
            hintText: "trade_licence_no".tr,
          ),
          CustomTextField(
            title: "rl_no".tr,
            controller: rlNoController,
            hintText: "rl_no".tr,),
          CustomTextField(
            title : "website_url".tr,
            controller: websiteUrlController,
            hintText: "website_url".tr,),

        ]),
      ])),


          CustomContainer(showShadow: false, borderRadius: 5,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("contact_person_information".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

                ResponsiveMasonryGrid(children: [
                  CustomTextField(title: "contact_person_name".tr,
                      controller: contactPersonNameController,
                      hintText: "contact_person_name".tr),

                  CustomTextField(title: "contact_person_designation".tr,
                      controller: contactPersonDesignationController,
                      hintText: "contact_person_designation".tr),

                  CustomTextField(title: "contact_person_email".tr,
                      controller: contactPersonEmailController,
                      hintText: "contact_person_email".tr),

                  GetBuilder<AuthenticationController>(
                    builder: (authenticationController) {
                      return CustomTextField(
                        isCodePicker: true,
                        title: "contact_person_phone".tr,
                        hintText: 'contact_person_phone'.tr,
                        inputType: TextInputType.number,
                        countryDialCode: authenticationController.countryDialCode,
                        prefixHeight: 35,
                        inputFormatters: [AppConstants.phoneNumberFormat],
                        controller: contactPersonPhoneController,
                        inputAction: TextInputAction.done,
                        onCountryChanged: (CountryCode countryCode){
                          authenticationController.countryDialCode = countryCode.dialCode!;
                          authenticationController.setCountryCode(countryCode.dialCode!);
                        },
                      );
                    }
                  )

                ]),
              ])),

          CustomContainer(borderRadius: 5, showShadow: false,
              verticalPadding: Dimensions.paddingSizeLarge,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Dimensions.paddingSizeDefault,
                children: [
                  Text("you_are_almost_done".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

                  CaptchaVerificationWidget(),

                  GetBuilder<AuthenticationController>(
                    builder: (controller) {
                      return CustomCheckbox(value: controller.isAccept,
                      onChange: (){
                        controller.setAccept(!controller.isAccept);
                      },
                      title: "i_have_read_and_accept_privacy_policy".tr);
                    }
                  )
                ],
              )),

          GetBuilder<AuthenticationController>(
            builder: (controller) {
              return controller.isLoading?
              Center(child: const CircularProgressIndicator()):
              CustomButton(onTap: (controller.isAccept && controller.captchaVerified)?(){
                String username = userNameController.text.trim();
                String password = passwordController.text.trim();
                String confirmPassword = confirmPasswordController.text.trim();
                String companyName = companyNameController.text.trim();
                String establishedIn = establishedInController.text.trim();
                String companyDetails = companyDetailsController.text.trim();
                String companyAddress = companyAddressController.text.trim();
                String businessDescription = businessDescriptionController.text.trim();
                String tradeLicenceNo = tradeLicenceNoController.text.trim();
                // String rlNo = rlNoController.text.trim();
                String website = websiteUrlController.text.trim();
                String contactPersonName = contactPersonNameController.text.trim();
                String contactPersonDesignation = contactPersonDesignationController.text.trim();
                String contactPersonEmail = contactPersonEmailController.text.trim();
                String contactPersonPhone = contactPersonPhoneController.text.trim();

                int? industryId = Get.find<LandingPageController>().selectedIndustryItem?.id;


                if(username.isEmpty){
                  showCustomSnackBar("username_is_empty".tr);
                }else if(password.isEmpty){
                  showCustomSnackBar("password_is_empty".tr);
                }else if(confirmPassword.isEmpty){
                  showCustomSnackBar("confirm_password_is_empty".tr);
                }else if(companyName.isEmpty){
                  showCustomSnackBar("company_name_is_empty".tr);
                }else if(establishedIn.isEmpty){
                  showCustomSnackBar("established_in_is_empty".tr);
                }else if(companyDetails.isEmpty){
                  showCustomSnackBar("company_details_is_empty".tr);
                }else if(companyAddress.isEmpty){
                  showCustomSnackBar("company_address_is_empty".tr);
                }else if(businessDescription.isEmpty){
                  showCustomSnackBar("business_description_is_empty".tr);
                }else if(tradeLicenceNo.isEmpty){
                  showCustomSnackBar("trade_licence_no_is_empty".tr);
                }else if(contactPersonName.isEmpty){
                  showCustomSnackBar("contact_person_name_is_empty".tr);
                }else if(contactPersonDesignation.isEmpty){
                  showCustomSnackBar("contact_person_designation_is_empty".tr);
                }else if(contactPersonEmail.isEmpty){
                  showCustomSnackBar("contact_person_email_is_empty".tr);
                }else if(contactPersonPhone.isEmpty){
                  showCustomSnackBar("contact_person_phone_is_empty".tr);
                  }
                else{
                  CreateCompanyAccountBody body = CreateCompanyAccountBody(
                    firstName: contactPersonName,
                    companyName: companyName,
                    website: website,
                    location: companyAddress,
                    industryId: industryId,
                    phone: controller.countryDialCode + contactPersonPhone,
                    password: password,
                    passwordConfirmation: confirmPassword,
                    email: contactPersonEmail,
                  );
                  controller.companyRegistration(body);

                }

              }: null, text: "continue".tr);
            }
          )

    ]);
  }
}
