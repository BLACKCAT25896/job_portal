import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_app_bar.dart';

class CandidateShortAndDetailsProfileResumeScreen extends StatelessWidget {
  const CandidateShortAndDetailsProfileResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "view_profile".tr),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [

        ]))
      ]),
    );
  }
}
