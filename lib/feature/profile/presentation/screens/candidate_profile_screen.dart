
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/candidate_base_layout.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/candidate_certificate/presentation/widgets/candidate_certificate_list_widget.dart';
import 'package:job/feature/candidate_education/presentation/widgets/candidate_education_list_widget.dart';
import 'package:job/feature/candidate_experience/presentation/widgets/candidate_experience_list_widget.dart';
import 'package:job/feature/candidate_links/presentation/widgets/candidate_link_list_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/address_details_widget.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_personal_details_widget.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_profile_section_widget.dart';
import 'package:job/feature/candidate_panel/widgets/career_and_application_informaton.dart';
import 'package:job/feature/candidate_panel/widgets/relevant_information_widget.dart';
import 'package:job/feature/candidate_reference/presentation/widgets/candidate_reference_list_widget.dart';
import 'package:job/feature/candidate_training/presentation/widgets/candidate_training_list_widget.dart';
import 'package:job/feature/profile/presentation/widgets/candidate_dashboard/dashboard_heading_widget.dart';
import 'package:job/util/dimensions.dart';

class CandidateProfileScreen extends StatefulWidget {
  const CandidateProfileScreen({super.key});

  @override
  State<CandidateProfileScreen> createState() => _CandidateProfileScreenState();
}

class _CandidateProfileScreenState extends State<CandidateProfileScreen> {

  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CandidateBaseLayout(scrollController: scrollController,
          child: CustomContainer(
            child: GetBuilder<CandidatePanelController>(builder: (controller) {
                return Column(spacing: Dimensions.paddingSizeDefault, children: [
                  DashboardHeadingWidget(),
                  CandidateProfileSectionWidget(),
                  if(controller.selectedSection?.name  == "personal_information")...[
                    CandidatePersonalDetailsWidget(),
                    AddressDetailsWidget(),
                    CareenAndApplicationWidget(),
                    RelevantInformationWidget()
                  ]else if(controller.selectedSection?.name  == "education_and_training")...[
                    CandidateEducationListWidget(scrollController: scrollController),
                    CandidateTrainingListWidget(scrollController: scrollController),
                    CandidateCertificateListWidget(scrollController: scrollController)
                  ]else if(controller.selectedSection?.name  == "employment")...[
                    CandidateExperienceListWidget(scrollController: scrollController)
                  ]else if(controller.selectedSection?.name  == "other_information")...[
                    CandidateReferenceListWidget(scrollController: scrollController),
                    CandidateLinkListWidget(scrollController: scrollController)

                    ]

                ]);
              }
            ),
          )),
    );
  }

}


