import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_icon_text_button.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class RelevantInformationWidget extends StatelessWidget {
  const RelevantInformationWidget({super.key});

  static const String sectionKey = "relevant_information";

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveHelper.isDesktop(context);

    return GetBuilder<ProfileController>(
      builder: (profileController) {
        final info = profileController.profileModel?.data?.candidateInfo;

        return GetBuilder<CandidatePanelController>(
          builder: (candidateController) {

            final content = _buildContent(info);

            if (!isDesktop) {
              return content;
            }

            return CustomExpandCollapse(
              isExpanded: candidateController.isExpanded(sectionKey),
              onChanged: (_) => candidateController.toggleSection(sectionKey),
              header: Text("relevant_information".tr, style: sectionHeadingTextStyle(context)),
              trailing: CustomIconTextButton(text: "edit".tr, onTap: () {

              },
                icon: Images.edit,
              ),
              child: content,
            );
          },
        );
      },
    );
  }

  Widget _buildContent(dynamic info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Dimensions.paddingSizeDefault,
      children: [
        CandidateDetailItem(
          title: "career_summery".tr,
          value: info?.careerSummary ?? '-',
        ),

        CandidateDetailItem(
          title: "special_qualification".tr,
          value: info?.specialQualification ?? '-',
        ),

        CandidateDetailItem(
          title: "keyword".tr,
          value: info?.keywords ?? "-",
        ),
      ],
    );
  }
}