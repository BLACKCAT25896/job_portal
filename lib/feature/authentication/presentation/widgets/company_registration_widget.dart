import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_checkbox.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/authentication/domain/model/create_company_account_body.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/authentication/presentation/widgets/captcha_verification.dart';
import 'package:job/feature/authentication/presentation/widgets/company_registration_heading_widget.dart';
import 'package:job/feature/authentication/presentation/widgets/edit_company_information_header_section.dart';
import 'package:job/feature/authentication/presentation/widgets/employee_number_selection_widget.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/frontend/presentation/widgets/industry/select_public_industry_widget.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:get/get.dart';

class CompanyRegistrationWidget extends StatefulWidget {
  final String type;
  const CompanyRegistrationWidget({super.key, required this.type});

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
  void initState() {
    super.initState();
    if(widget.type == "edit"){
      loadData();
    }
  }

  Future<void> loadData() async {
    await Get.find<ProfileController>().getCompanyProfileInfo().then((val){
      final data = Get.find<ProfileController>().profileModel?.data;
      userNameController.text = data?.name??'';
      companyNameController.text = data?.companyInfo?.name??'';
      establishedInController.text = data?.companyInfo?.establishedIn??'';
      companyDetailsController.text = data?.companyInfo?.details??'';
      companyAddressController.text = data?.companyInfo?.address??'';
      businessDescriptionController.text = data?.companyInfo?.details??'';
      tradeLicenceNoController.text = data?.companyInfo?.businessTradeLicenseNo??'';
      rlNoController.text = data?.companyInfo?.rlNo??'';
      websiteUrlController.text = data?.companyInfo?.website??'';
      contactPersonNameController.text = data?.companyInfo?.contactPersonName??'';
      contactPersonDesignationController.text = data?.companyInfo?.contactPersonDesignation??'';
      contactPersonEmailController.text = data?.companyInfo?.contactPersonEmail??'';
      contactPersonPhoneController.text = data?.companyInfo?.contactPersonMobile??'';
      if(data?.companyInfo?.industry != null) {
        Get.find<LandingPageController>().selectIndustry(data!.companyInfo!.industry!, notify: false);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Dimensions.paddingSizeDefault, children: [

          widget.type  == "create"?
          CompanyRegistrationHeadingWidget():EditCompanyInformationHeaderSection(),

      CustomContainer(
        horizontalPadding: Dimensions.paddingSizeLarge,
          verticalPadding: Dimensions.paddingSizeLarge,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: Dimensions.paddingSizeLarge),


        if(widget.type == "create")
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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




            Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: EmployeeNumberSelectionWidget()),

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
                        title: "contact_person_phone".tr,
                        hintText: 'contact_person_phone'.tr,
                        inputType: TextInputType.number,
                        prefixHeight: 35,
                        inputFormatters: [AppConstants.phoneNumberFormat],
                        controller: contactPersonPhoneController,
                        inputAction: TextInputAction.done,
                      );
                    }
                  )

                ]),
              ])),

          if(widget.type == "create")
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

          GetBuilder<AuthenticationController>(builder: (controller) {
              return controller.isLoading?
              Center(child: const CircularProgressIndicator()):
              CustomButton(onTap: ((controller.isAccept && controller.captchaVerified) || widget.type == "edit")?(){
                String username = userNameController.text.trim();
                String password = passwordController.text.trim();
                String confirmPassword = confirmPasswordController.text.trim();
                String companyName = companyNameController.text.trim();
                String establishedIn = establishedInController.text.trim();
                String companyDetails = companyDetailsController.text.trim();
                String companyAddress = companyAddressController.text.trim();
                String businessDescription = businessDescriptionController.text.trim();
                String tradeLicenceNo = tradeLicenceNoController.text.trim();
                String website = websiteUrlController.text.trim();
                String contactPersonName = contactPersonNameController.text.trim();
                String contactPersonDesignation = contactPersonDesignationController.text.trim();
                String contactPersonEmail = contactPersonEmailController.text.trim();
                String contactPersonPhone = contactPersonPhoneController.text.trim();
                String rlNo = rlNoController.text.trim();
                int? industryId = Get.find<LandingPageController>().selectedIndustryItem?.id;


                if(widget.type == "create" && username.isEmpty){
                  showCustomSnackBar("username_is_empty".tr);
                }else if(widget.type == "create" && password.isEmpty){
                  showCustomSnackBar("password_is_empty".tr);
                }else if(widget.type == "create" && confirmPassword.isEmpty){
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
                    username: username,
                    firstName: "-",
                    lastName: "-",
                    phone: controller.countryDialCode + contactPersonPhone,
                    contactPersonDesignation: contactPersonDesignation,
                    contactPersonEmail: contactPersonEmail,
                    contactPersonName: contactPersonName,
                    contactPersonMobile: controller.countryDialCode + contactPersonPhone,
                    establishedIn: establishedIn,
                    details: companyDetails,
                    businessTradeLicenseNo: tradeLicenceNo,
                    companyName: companyName,
                    website: website,
                    address: companyAddress,
                    industryId: industryId,
                    password: password,
                    passwordConfirmation: confirmPassword,
                    email: contactPersonEmail,
                    rlNo: rlNo,
                  );
                  if(widget.type == "edit"){
                    Get.find<ProfileController>().updateCompanyProfile(body);
                  }else {
                    controller.companyRegistration(body);
                  }

                }

              }: null, text: "continue".tr);
            }
          )

    ]);
  }
}
