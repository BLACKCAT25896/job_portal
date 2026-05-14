
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/candidate_training/presentation/screens/create_new_candidate_training_screen.dart';
import 'package:job/feature/candidate_training/presentation/widgets/candidate_training_list_widget.dart';

class CandidateTrainingScreen extends StatefulWidget {
  const CandidateTrainingScreen({super.key});

  @override
  State<CandidateTrainingScreen> createState() => _CandidateTrainingScreenState();
}

class _CandidateTrainingScreenState extends State<CandidateTrainingScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_training".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: CandidateTrainingListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewCandidateTrainingScreen())));
  }
}



