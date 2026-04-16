
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_floating_button.dart';
import 'package:mighty_job/feature/candidate_education/presentation/screens/create_new_candidate_education_screen.dart';
import 'package:mighty_job/feature/candidate_education/presentation/widgets/candidate_education_list_widget.dart';

class CandidateEducationScreen extends StatefulWidget {
  const CandidateEducationScreen({super.key});

  @override
  State<CandidateEducationScreen> createState() => _CandidateEducationScreenState();
}

class _CandidateEducationScreenState extends State<CandidateEducationScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_education".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: CandidateEducationListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewCandidateEducationScreen())));
  }
}



