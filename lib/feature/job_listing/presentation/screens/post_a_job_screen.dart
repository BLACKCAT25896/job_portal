import 'package:mighty_job/common/layout/base_layout.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/post_a_job_section/billing_and_contact_info_widget.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/post_a_job_section/candidate_requirements_widget.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/post_a_job_section/job_information_widget.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/post_a_job_section/matching_and_restrictions_widget.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/post_a_job_section/post_a_job_step_widget.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/post_a_job_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostAJobScreen extends StatefulWidget {
  final JobListingItem? listingItem;
  const PostAJobScreen({super.key, this.listingItem});

  @override
  State<PostAJobScreen> createState() => _PostAJobScreenState();
}

class _PostAJobScreenState extends State<PostAJobScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController, child: Center(
      child: SizedBox(width: Dimensions.webMaxWidth,
        child: Column(children: [
          SectionHeaderWithPath(sectionTitle: "post_a_job".tr),
          Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Row(spacing: Dimensions.paddingSizeDefault,
              crossAxisAlignment: CrossAxisAlignment.start, children: [
                PostAJobStepWidget(),
                Expanded(child: GetBuilder<JobListingController>(
                  builder: (controller) {

                    return controller.selectedStepIndex == 0?
                    JobInformationWidget():
                    controller.selectedStepIndex == 1?
                    CandidateRequirementsWidget():
                    controller.selectedStepIndex == 2?
                    MatchingAndRestrictionsWidget():
                    BillingAndContactInfoWidget();
                  }
                )),
              ],
            ),
          ),
        ],
        ),
      ),
    ));
  }
}
