
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/candidate_resume/presentation/screens/create_new_candidate_resume_screen.dart';
import 'package:mighty_job/feature/candidate_resume/presentation/widgets/candidate_resume_list_widget.dart';

class CandidateResumeScreen extends StatefulWidget {
  const CandidateResumeScreen({super.key});

  @override
  State<CandidateResumeScreen> createState() => _CandidateResumeScreenState();
}

class _CandidateResumeScreenState extends State<CandidateResumeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_resume".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: CandidateResumeListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewCandidateResumeScreen())));
  }
}



