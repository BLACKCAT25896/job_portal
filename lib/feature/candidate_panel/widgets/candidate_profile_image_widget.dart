import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/image_picker_widget.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CandidateProfileImageWidget extends StatelessWidget {
  const CandidateProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (profileController) {
        final data = profileController.profileModel?.data;
        final candidate = data?.candidateInfo;
        if(candidate == null) return Container();
        return Row(spacing: Dimensions.paddingSizeSmall, children: [
          ImagePickerWidget(borderRadius: 123,
              pickedFile: profileController.profileAvatar,
              imageUrl: "${AppConstants.imageBaseUrl}/users/${data?.image}",
              onImagePicked: ()=> profileController.pickImage(),
              width: 70, height: 70),
          Column(spacing: Dimensions.paddingSizeExtraSmall,
              crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(spacing: Dimensions.paddingSizeSmall, children: [
                  CustomContainer(borderRadius: 5, showShadow: false,
                      onTap: (){
                        if(profileController.profileAvatar != null){
                          profileController.updateProfileAvatar();
                        }else{
                          showCustomSnackBar("select_image".tr);
                        }
                      },
                      border: Border.all(width: .25, color: Theme.of(context).hintColor),
                      child: Text("change_image".tr)),

                ]),
                Text("upload_your_profile_image".tr, style: textRegular)
              ])
        ]);
      }
    );
  }
}
