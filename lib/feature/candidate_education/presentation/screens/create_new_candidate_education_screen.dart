import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/candidate_education/domain/models/candidate_education_model.dart';
import 'package:mighty_job/feature/candidate_education/presentation/widgets/add_new_candidate_education_widget.dart';

class CreateNewCandidateEducationScreen extends StatefulWidget {
  final CandidateEducationItem? candidateEducationItem;
  const CreateNewCandidateEducationScreen({super.key, this.candidateEducationItem});

  @override
  State<CreateNewCandidateEducationScreen> createState() => _CreateNewCandidateEducationScreenState();
}

class _CreateNewCandidateEducationScreenState extends State<CreateNewCandidateEducationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_education".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: AddNewCandidateEducationWidget(candidateEducationItem: widget.candidateEducationItem),)]));
  }
}
