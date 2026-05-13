import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_icon_text_button.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class RelevantInformationWidget extends StatelessWidget {
  const RelevantInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidatePanelController>(builder: (controller) {
      return CustomExpandCollapse(
          isExpanded: controller.isExpanded("relevant_information"),
            onChanged: (v) => controller.toggleSection("relevant_information"),
            header: Text("relevant_information".tr,
            style: sectionHeadingTextStyle(context)),
            trailing: CustomIconTextButton(text: "edit".tr,onTap: (){}, icon: Images.edit),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimensions.paddingSizeDefault, children: [
                CandidateDetailItem(title: "career_summery".tr, value: "As a passionate and experienced Flutter developer, Aim to leverage my skills in cross-platform mobile application development to create innovative and user-friendly apps that enhance user experiences and drive business success."),
                CandidateDetailItem(title: "special_qualification".tr, value: "working..."),
                CandidateDetailItem(title: "keyword".tr, value: "88888"),

              ],
            ));
      }
    );
  }
}


