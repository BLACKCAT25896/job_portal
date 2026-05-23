import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/custom_icon_text_button.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_profile_image_widget.dart';
import 'package:job/feature/candidate_panel/widgets/edit_candidate_personal_details_widget.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class CandidatePersonalDetailsWidget extends StatelessWidget {
  const CandidatePersonalDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveHelper.isDesktop(context);

    return GetBuilder<CandidatePanelController>(
      builder: (controller) {
        return GetBuilder<ProfileController>(
          initState: (_) {
            final profileController = Get.find<ProfileController>();

            if (profileController.profileModel == null) {
              profileController.getCandidateProfileInfo();
            }
          },
          builder: (profileController) {
            final data = profileController.profileModel?.data;
            final candidate = data?.candidateInfo;

            if (candidate == null) {
              return const SizedBox();
            }

            Widget content = _buildContent(data, candidate);

            if (!isDesktop) {
              return content;
            }

            return CustomExpandCollapse(
              initiallyExpanded: true,
              isExpanded: controller.isExpanded("personal_details"),
              onChanged: (_) =>
                  controller.toggleSection("personal_details"),
              header: Text(
                "personal_details".tr,
                style: sectionHeadingTextStyle(context),
              ),
              trailing: CustomIconTextButton(
                text: "edit".tr,
                icon: Images.edit,
                onTap: () {
                  Get.dialog(
                    CustomDialogWidget(
                      title: "personal_details".tr,
                      width: 900,
                      child: EditCandidatePersonalDetailsWidget(),
                    ),
                  );
                },
              ),
              child: content,
            );
          },
        );
      },
    );
  }

  Widget _buildContent(dynamic data, dynamic candidate) {
    return Column(
      spacing: Dimensions.paddingSizeDefault,
      children: [
        const CandidateProfileImageWidget(),

        ResponsiveMasonryGrid(
          children: [
            CandidateDetailItem(
              title: "name".tr,
              value: "${data?.name}",
            ),
            CandidateDetailItem(
              title: "fathers_name".tr,
              value: candidate.fatherName ?? "-",
            ),
            CandidateDetailItem(
              title: "mothers_name".tr,
              value: candidate.motherName ?? "-",
            ),
            CandidateDetailItem(
              title: "date_of_birth".tr,
              value: candidate.dob ?? "-",
            ),
            CandidateDetailItem(
              title: "gender".tr,
              value: candidate.gender ?? "-",
            ),
            CandidateDetailItem(
              title: "religion".tr,
              value: candidate.religion ?? "-",
            ),
            CandidateDetailItem(
              title: "marital_status".tr,
              value: candidate.maritalStatus ?? "-",
            ),
            CandidateDetailItem(
              title: "nationality".tr,
              value: candidate.nationality ?? "-",
            ),
            CandidateDetailItem(
              title: "national_id_number".tr,
              value: candidate.nationalIdCard ?? "-",
            ),
            CandidateDetailItem(
              title: "passport_number".tr,
              value: candidate.passportNumber ?? "-",
            ),
            CandidateDetailItem(
              title: "passport_expiry_date".tr,
              value: candidate.passportIssueDate ?? "-",
            ),
            CandidateDetailItem(
              title: "primary_mobile".tr,
              value: data?.phone ?? "-",
            ),
            CandidateDetailItem(
              title: "secondary_mobile".tr,
              value: candidate.secondaryMobile ?? "-",
            ),
            CandidateDetailItem(
              title: "primary_email".tr,
              value: data?.email ?? "-",
            ),
            CandidateDetailItem(
              title: "alternative_email".tr,
              value: candidate.alternateEmail ?? "-",
            ),
            CandidateDetailItem(
              title: "emergency_contact".tr,
              value: candidate.emergencyContact ?? "-",
            ),
            CandidateDetailItem(
              title: "blood_group".tr,
              value: candidate.bloodGroup ?? "-",
            ),
            CandidateDetailItem(
              title: "height".tr,
              value: candidate.height ?? "-",
            ),
            CandidateDetailItem(
              title: "weight".tr,
              value: candidate.weight ?? "-",
            ),
          ],
        ),
      ],
    );
  }
}

class CandidateDetailItem extends StatelessWidget {
  final String title;
  final String value;

  const CandidateDetailItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textRegular.copyWith(
            fontSize: Dimensions.fontSizeExtraSmall,
            color: Theme.of(context).hintColor,
          ),
        ),

        Text(value, style: textRegular),
      ],
    );
  }
}