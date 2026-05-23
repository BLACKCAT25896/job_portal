
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/feature/job_application/presentation/widgets/job_application_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class JobApplicationMobileScreen extends StatefulWidget {
  const JobApplicationMobileScreen({super.key});

  @override
  State<JobApplicationMobileScreen> createState() => _JobApplicationMobileScreenState();
}

class _JobApplicationMobileScreenState extends State<JobApplicationMobileScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "applied_jobs".tr),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
          JobApplicationListWidget(scrollController: scrollController)
        ]))
      ]),
    );
  }
}



