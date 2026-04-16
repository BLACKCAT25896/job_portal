
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/candidate_experience/presentation/screens/create_new_candidate_experience_screen.dart';
import 'package:mighty_job/feature/candidate_experience/presentation/widgets/candidate_experience_list_widget.dart';

class CandidateExperienceScreen extends StatefulWidget {
  const CandidateExperienceScreen({super.key});

  @override
  State<CandidateExperienceScreen> createState() => _CandidateExperienceScreenState();
}

class _CandidateExperienceScreenState extends State<CandidateExperienceScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_experience".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: CandidateExperienceListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewCandidateExperienceScreen())));
  }
}



