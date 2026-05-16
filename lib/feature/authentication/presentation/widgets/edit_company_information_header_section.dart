import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/image_picker_widget.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class EditCompanyInformationHeaderSection extends StatelessWidget {
  const EditCompanyInformationHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("edit_company_information".tr, style: sectionHeadingTextStyle(context)),
      Text("set_up_your_hiring_needs".tr, style: textRegular),
      
      Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
        child: CustomDivider()),
      
      GetBuilder<AuthenticationController>(builder: (controller) {
          return GetBuilder<ProfileController>(builder: (profileController) {
            final model = profileController.profileModel?.data;
              return Row(children: [
                  ImagePickerWidget(onImagePicked: ()=> controller.pickImage(),
                      alignment: CrossAxisAlignment.start,
                      imageAlignment: Alignment.centerLeft,
                      pickedFile: controller.userImage,
                      imageUrl: "${AppConstants.imageBaseUrl}/company/${model?.companyInfo?.logo}", title: "upload_your_company_logo".tr),

                  IntrinsicWidth(child: CustomButton(onTap: () {
                    if(controller.userImage != null){
                      profileController.updateCompanyLogo();
                    }else{
                      showCustomSnackBar("please_select_image".tr);
                    }
                  }, text: "confirm".tr))
                ],
              );
            }
          );
        }
      )
    ]);
  }
}
