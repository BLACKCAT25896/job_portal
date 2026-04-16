import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/candidate_experience/domain/models/candidate_experience_model.dart';
import 'package:mighty_job/feature/candidate_experience/presentation/widgets/add_new_candidate_experience_widget.dart';

class CreateNewCandidateExperienceScreen extends StatefulWidget {
  final CandidateExperienceItem? candidateExperienceItem;
  const CreateNewCandidateExperienceScreen({super.key, this.candidateExperienceItem});

  @override
  State<CreateNewCandidateExperienceScreen> createState() => _CreateNewCandidateExperienceScreenState();
}

class _CreateNewCandidateExperienceScreenState extends State<CreateNewCandidateExperienceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_education".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: AddNewCandidateExperienceWidget(candidateExperienceItem: widget.candidateExperienceItem),)]));
  }
}
