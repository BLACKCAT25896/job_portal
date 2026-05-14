
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/candidate_links/presentation/screens/create_new_candidate_link_screen.dart';
import 'package:job/feature/candidate_links/presentation/widgets/candidate_link_list_widget.dart';

class CandidateLinkScreen extends StatefulWidget {
  const CandidateLinkScreen({super.key});

  @override
  State<CandidateLinkScreen> createState() => _CandidateLinkScreenState();
}

class _CandidateLinkScreenState extends State<CandidateLinkScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_link".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: CandidateLinkListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewCandidateLinkScreen())));
  }
}



