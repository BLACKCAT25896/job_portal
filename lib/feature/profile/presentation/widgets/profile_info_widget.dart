import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/profile/domain/model/profile_model.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        initState: (val) {
          String userType = Get.find<AuthenticationController>().getUserType();
          if(userType == "Super Admin"){
            if(Get.find<ProfileController>().profileModel == null) {
              Get.find<ProfileController>().getProfileInfo();
            }
          }else if(userType == "Company" || userType == "Employer"){
            if(Get.find<ProfileController>().profileModel == null) {
              Get.find<ProfileController>().getCompanyProfileInfo();
            }
          }else if(userType == "Candidate"){
            if(Get.find<ProfileController>().profileModel == null) {
              Get.find<ProfileController>().getCandidateProfileInfo();
            }
          }

        },
        builder: (profileController) {
          ProfileModel? profile = profileController.profileModel;

          return Column(spacing: Dimensions.paddingSizeSmall, children: [
            CustomContainer(border: Border.all(width: .125, color: Theme.of(context).hintColor), showShadow: false, horizontalPadding: 0, verticalPadding: 0, borderRadius: 120,
                child: const CustomImage(width: 50,height: 50,radius: 120,)),

            Text(" ${profile?.data?.name??'N/A'}", style: textSemiBold.copyWith(
                fontSize: Dimensions.fontSizeLarge ))
          ]);
        }
    );
  }
}
