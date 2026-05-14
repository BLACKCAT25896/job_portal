import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/feature/candidate_reference/domain/models/candidate_reference_model.dart';
import 'package:job/feature/candidate_reference/presentation/widgets/add_new_candidate_reference_widget.dart';

class CreateNewCandidateReferenceScreen extends StatefulWidget {
  final CandidateReferenceItem? candidateReferenceItem;
  const CreateNewCandidateReferenceScreen({super.key, this.candidateReferenceItem});

  @override
  State<CreateNewCandidateReferenceScreen> createState() => _CreateNewCandidateReferenceScreenState();
}

class _CreateNewCandidateReferenceScreenState extends State<CreateNewCandidateReferenceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_reference".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: AddNewCandidateReferenceWidget(candidateReferenceItem: widget.candidateReferenceItem),)]));
  }
}
