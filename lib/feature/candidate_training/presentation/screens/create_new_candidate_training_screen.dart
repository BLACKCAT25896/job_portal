import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/feature/candidate_training/domain/models/candidate_training_model.dart';
import 'package:job/feature/candidate_training/presentation/widgets/add_new_candidate_training_widget.dart';

class CreateNewCandidateTrainingScreen extends StatefulWidget {
  final CandidateTrainingItem? candidateTrainingItem;
  const CreateNewCandidateTrainingScreen({super.key, this.candidateTrainingItem});

  @override
  State<CreateNewCandidateTrainingScreen> createState() => _CreateNewCandidateTrainingScreenState();
}

class _CreateNewCandidateTrainingScreenState extends State<CreateNewCandidateTrainingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_training".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: AddNewCandidateTrainingWidget(candidateTrainingItem: widget.candidateTrainingItem),)]));
  }
}
