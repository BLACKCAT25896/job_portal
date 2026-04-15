import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/human_resource/candidate/presentation/widgets/add_new_candidate_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/human_resource/candidate/domain/models/candidate_model.dart';

class CreateNewCandidateScreen extends StatefulWidget {
  final CandidateItem? candidateItem;
  const CreateNewCandidateScreen({super.key, this.candidateItem});

  @override
  State<CreateNewCandidateScreen> createState() => _CreateNewCandidateScreenState();
}

class _CreateNewCandidateScreenState extends State<CreateNewCandidateScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate".tr),
        body: CustomWebScrollView(slivers: [
          SliverToBoxAdapter(
            child: AddNewCandidateWidget(candidateItem: widget.candidateItem),)]));
  }
}
