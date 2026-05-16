import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/profile/domain/model/profile_model.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class HeaderProfileInfo extends StatelessWidget {
  const HeaderProfileInfo({super.key});

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

          return CustomContainer(borderRadius: 120, verticalPadding: 4, horizontalPadding: 7,
            showShadow: false, color: Theme.of(context).hintColor.withValues(alpha: .125),
            child: Row(spacing: Dimensions.paddingSizeSmall, children: [
              CustomContainer(border: Border.all(width: .125, color: Theme.of(context).hintColor), showShadow: false, horizontalPadding: 0, verticalPadding: 0, borderRadius: 120,
                  child: CustomImage(width: 30,height: 30,radius: 120,
                  image: profile?.data?.image != null?
                  "${AppConstants.imageBaseUrl}/users/${profile?.data?.image??''}" : "",)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Text(" ${profile?.data?.name??'N/A'}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault )),
                  Icon(Icons.keyboard_arrow_down, size: 20, color: Theme.of(context).hintColor)
                ],
                ),
              ])
            ]),
          );
        }
    );
  }
}
