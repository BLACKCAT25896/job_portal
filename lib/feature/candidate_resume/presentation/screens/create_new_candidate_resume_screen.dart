import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/candidate_resume/domain/models/candidate_resume_model.dart';
import 'package:mighty_job/feature/candidate_resume/presentation/widgets/add_new_candidate_resume_widget.dart';

class CreateNewCandidateResumeScreen extends StatefulWidget {
  final CandidateResumeItem? candidateResumeItem;
  const CreateNewCandidateResumeScreen({super.key, this.candidateResumeItem});

  @override
  State<CreateNewCandidateResumeScreen> createState() => _CreateNewCandidateResumeScreenState();
}

class _CreateNewCandidateResumeScreenState extends State<CreateNewCandidateResumeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_resume".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: AddNewCandidateResumeWidget(candidateResumeItem: widget.candidateResumeItem),)]));
  }
}
