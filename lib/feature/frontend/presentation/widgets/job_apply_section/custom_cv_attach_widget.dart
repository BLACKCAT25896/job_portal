import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/candidate_resume/controller/candidate_resume_controller.dart';
import 'package:job/feature/candidate_resume/presentation/screens/create_new_candidate_resume_screen.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:get/get.dart';

class CustomCvAttachWidget extends StatelessWidget {
  const CustomCvAttachWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateResumeController>(
      initState: (val){
        Get.find<CandidateResumeController>().getCandidateResumeList(1);
      },
      builder: (controller) {
        final model = controller.candidateResumeModel;
        final data = model?.data;
        final resume = data?.data?.first;

        return CustomContainer(child: Column(spacing: Dimensions.paddingSizeDefault, children: [

          Row(children: [
            Expanded(
              child: Row(spacing: 5, children: [
                Icon(Icons.file_copy, color: systemPrimaryColor(),size: 18),
                Text("customized_cv".tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge))
              ]),
            ),

            SizedBox(width: 120,
              child: CustomButton(borderColor: systemPrimaryColor(),
                  textColor: systemPrimaryColor(),
                  buttonColor: Theme.of(context).cardColor,
                  onTap: (){
                Get.to(()=> CreateNewCandidateResumeScreen());
                  }, text: "change_cv".tr),
            )
          ]),
          if(resume != null)
          CustomContainer(showShadow: false,
            border: Border.all(color: systemPrimaryColor().withValues(alpha: .15)),
            child: Row(spacing: Dimensions.paddingSizeSmall, children: [
            CustomContainer(borderRadius: 5, child: Icon(Icons.picture_as_pdf)),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("${resume.fileName}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
              Text("${"uploaded_on".tr} : ${resume.createdAt}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall))
            ])
          ]),)
        ]));
      }
    );
  }
}
