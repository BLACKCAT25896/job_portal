import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:job/feature/contact_us/controller/contact_us_controller.dart';
import 'package:job/feature/contact_us/domain/model/contact_us_body.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController,
      child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
          child: GetBuilder<LandingPageController>(builder: (controller) {

            return Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
              child: ResponsiveMasonryGrid(width: 600, children: [
                  const _ContactInfo(),
                  const _ContactForm(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

}
class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemSettingsController>(builder: (settingController) {
        final model = settingController.generalPublicSettingModel;
        final info = model?.data;
        return Padding(padding: const EdgeInsets.only(top: 50),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min, children: [
            Text("contact_us".tr, style: textSemiBold.copyWith(fontSize: 28)),
              const SizedBox(height: 12),
            Text("Get in touch with us for any questions, support, or feedback. Submit the form below and we’ll respond shortly.",
                style: textMedium.copyWith(fontSize: 16),),
              const SizedBox(height: 24),
              _contactItem(Icons.location_on, "address".tr, info?.companyAddress??''),
              const SizedBox(height: 16),
              _contactItem(Icons.phone, "phone".tr, info?.companyPhone??''),
              const SizedBox(height: 16),
              _contactItem(Icons.email, "email".tr, info?.companyEmail??''),
            ],
          ),
        );
      }
    );
  }

  Widget _contactItem(IconData icon, String title, String detail) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(radius: 18,
          backgroundColor: systemPrimaryColor(),
          child: Icon(icon, size: 20)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: textMedium),
          const SizedBox(height: 2),
          Text(detail, style: textRegular),
        ])),
      ],
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return CustomContainer(horizontalPadding: Dimensions.paddingSizeDefault,
      verticalPadding: Dimensions.paddingSizeDefault,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end,
        spacing: Dimensions.paddingSizeSmall, children: [
        CustomTextField(title: "name".tr,
            controller: nameController,hintText: "name".tr),

        CustomTextField(title: "email".tr,
            controller: emailController, hintText: "email".tr),

          GetBuilder<AuthenticationController>(builder: (authenticationController) {
              return CustomTextField(
                hintText: 'phone'.tr,
                title: "phone".tr,
                inputType: TextInputType.number,
                countryDialCode: authenticationController.countryDialCode,
                prefixHeight: 70,
                inputFormatters: [AppConstants.phoneNumberFormat],
                controller: phoneController,
                inputAction: TextInputAction.done,
              );
            }
          ),



          CustomTextField(title: "message".tr,
            maxLines: 7, minLines: 4, inputType: TextInputType.multiline,
              inputAction: TextInputAction.newline,
              controller: messageController,
              hintText: "enter_message".tr),


          SizedBox(width: 120,
            child: GetBuilder<ContactUsController>(builder: (controller) {
                return controller.isLoading?
                    Center(child: CircularProgressIndicator()):
                CustomButton(onTap: () {
                  String name = nameController.text.trim();
                  String email = emailController.text.trim();
                  String phone = phoneController.text.trim();
                  String message = messageController.text.trim();
                  if(name.isEmpty){
                    showCustomSnackBar("enter_name".tr);
                  }else if(email.isEmpty){
                    showCustomSnackBar("enter_email".tr);
                  }else if(!GetUtils.isEmail(email)){
                    showCustomSnackBar("enter_valid_email".tr);
                  }else if(phone.isEmpty){
                    showCustomSnackBar("enter_phone".tr);
                  }else if(message.isEmpty){
                    showCustomSnackBar("enter_message".tr);
                  }else{
                    ContactUsBody body = ContactUsBody(
                      name: name, email: email, phone: phone, message: message
                    );
                    controller.contactUs(body).then((val){
                        if(val.statusCode == 200){
                          nameController.clear();
                          emailController.clear();
                          phoneController.clear();
                          messageController.clear();
                        }
                    });
                  }
                }, text:"submit".tr);
              }
            )),
        ],
      ),
    );
  }
}