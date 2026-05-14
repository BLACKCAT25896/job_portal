
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_floating_button.dart';
import 'package:job/feature/candidate_certificate/presentation/screens/create_new_candidate_certificate_screen.dart';
import 'package:job/feature/candidate_certificate/presentation/widgets/candidate_certificate_list_widget.dart';

class CandidateCertificateScreen extends StatefulWidget {
  const CandidateCertificateScreen({super.key});

  @override
  State<CandidateCertificateScreen> createState() => _CandidateCertificateScreenState();
}

class _CandidateCertificateScreenState extends State<CandidateCertificateScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "candidate_certificate".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: CandidateCertificateListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewCandidateCertificateScreen())));
  }
}



