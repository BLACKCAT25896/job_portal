import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/profile/domain/model/profile_model.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/helper/email_checker.dart';
import 'package:ecommerce/util/dimensions.dart';

class ProfileInformationWidget extends StatefulWidget {
  const ProfileInformationWidget({super.key});

  @override
  State<ProfileInformationWidget> createState() => _ProfileInformationWidgetState();
}

class _ProfileInformationWidgetState extends State<ProfileInformationWidget> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    nameController.text = Get.find<ProfileController>().profileModel?.data?.name??'';
    emailController.text = Get.find<ProfileController>().profileModel?.data?.email??'';


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      initState: (state) => Get.find<ProfileController>().getProfileInfo(),
      builder: (profileController) {
        ProfileModel? profileModel = profileController.profileModel;
        return CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomTitle(title: "profile_information"),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          const CustomSubTitle(title: "profile_info_sub_title"),
          const SizedBox(height: Dimensions.paddingSizeDefault),

          CustomTextField(title: "name".tr,
          controller: nameController,
          hintText: "${profileModel?.data?.name}"),

          CustomTextField(title: "email".tr,
            controller: emailController,
            inputType: TextInputType.emailAddress,
            hintText: profileModel?.data?.email??'enter_email'.tr),
          const SizedBox(height: Dimensions.paddingSizeDefault),


          SizedBox(width: 100, child:profileController.isLoading? const Center(child: CircularProgressIndicator()):
          CustomButton(borderRadius: 5,
              onTap: (){
            String name = nameController.text.trim();
            String email = emailController.text.trim();
            if(name.isEmpty){
              showCustomSnackBar("name_is_empty".tr);
            }

            else if(email.isNotEmpty && EmailChecker.isNotValid(email)){
              showCustomSnackBar("email_is_invalid".tr);
            }
            else if(profileModel?.data?.email == email && profileModel?.data?.name == name){
              showCustomSnackBar("nothing_change".tr);
            }

            else{
              profileController.updateProfile(name, email);
            }

              }, text: "submit".tr))
        ],),);
      }
    );
  }
}
