
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/candidate_reference/presentation/screens/create_new_candidate_reference_screen.dart';
import 'package:job/feature/candidate_reference/presentation/widgets/candidate_reference_list_widget.dart';

class CandidateReferenceScreen extends StatefulWidget {
  const CandidateReferenceScreen({super.key});

  @override
  State<CandidateReferenceScreen> createState() => _CandidateReferenceScreenState();
}

class _CandidateReferenceScreenState extends State<CandidateReferenceScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_certificate".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: CandidateReferenceListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewCandidateReferenceScreen())));
  }
}



