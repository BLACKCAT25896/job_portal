import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/feature/profile/domain/model/profile_model.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/util/dimensions.dart';

class EditRelevantInformationWidget extends StatefulWidget {
  const EditRelevantInformationWidget({super.key});

  @override
  State<EditRelevantInformationWidget> createState() => _EditRelevantInformationWidgetState();
}

class _EditRelevantInformationWidgetState extends State<EditRelevantInformationWidget> {

  TextEditingController careerSummeryController = TextEditingController();
  TextEditingController specialQualificationController = TextEditingController();
  TextEditingController keywordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    careerSummeryController.text = Get.find<ProfileController>().profileModel?.data?.candidateInfo?.careerSummary??'';
    specialQualificationController.text = Get.find<ProfileController>().profileModel?.data?.candidateInfo?.specialQualification??'';
    keywordController.text = Get.find<ProfileController>().profileModel?.data?.candidateInfo?.keywords??'';
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Dimensions.paddingSizeDefault, children: [

          CustomTextField(title: "career_summery".tr,
            hintText: "career_summery".tr,
            controller: careerSummeryController,
          minLines: 3, maxLines: 5,
          inputType: TextInputType.multiline,
          inputAction: TextInputAction.newline),

          CustomTextField(title: "special_qualification".tr,
            hintText: "special_qualification".tr,
            controller: specialQualificationController,
          minLines: 3, maxLines: 5,
          inputType: TextInputType.multiline,
          inputAction: TextInputAction.newline),

          CustomTextField(title: "keyword".tr,
            hintText: "keyword".tr,
            controller: keywordController,
          minLines: 3, maxLines: 5,
          inputType: TextInputType.multiline,
          inputAction: TextInputAction.newline),

          controller.isLoading? Center(child: CircularProgressIndicator()):
          CustomButton(onTap: (){
            String careerSummery = careerSummeryController.text;
            String specialQualification = specialQualificationController.text;
            String keyword = keywordController.text;

            if(careerSummery.isEmpty){
              showCustomSnackBar("career_summery_is_empty".tr);
            }else{
              controller.updateCandidateProfile(CandidateInfo(
                careerSummary: careerSummery,
                specialQualification: specialQualification,
                keywords: keyword
              ));
            }
          }, text: "confirm".tr)


        ],
      );
    });
  }
}


