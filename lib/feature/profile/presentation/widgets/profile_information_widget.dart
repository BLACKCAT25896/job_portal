import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/common/widget/custom_title.dart';
import 'package:job/feature/profile/domain/model/profile_model.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/helper/email_checker.dart';
import 'package:job/util/dimensions.dart';

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
    final data = Get.find<ProfileController>().profileModel?.data;
    nameController.text = data?.name??'';
    emailController.text = data?.email??'';


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
          SizedBox(height: Dimensions.paddingSizeExtraSmall),

          CustomTextField(title: "name".tr,
          controller: nameController,
          hintText: profileModel?.data?.name??'No Name'),

          CustomTextField(title: "email".tr,
            controller: emailController,
            inputType: TextInputType.emailAddress,
            hintText: profileModel?.data?.email??'email'.tr),

           SizedBox(height: Dimensions.paddingSizeDefault),


          SizedBox(width: 100, child:profileController.isLoading?
          const Center(child: CircularProgressIndicator()):
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
