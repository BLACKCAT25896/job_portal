
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/job_application/controller/job_application_controller.dart';
import 'package:mighty_job/feature/job_application/presentation/screens/create_new_job_application_screen.dart';
import 'package:mighty_job/feature/job_application/presentation/widgets/job_application_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class JobApplicationScreen extends StatefulWidget {
  const JobApplicationScreen({super.key});

  @override
  State<JobApplicationScreen> createState() => _JobApplicationScreenState();
}

class _JobApplicationScreenState extends State<JobApplicationScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "job_application".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<JobApplicationController>().getJobApplicationList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: JobApplicationListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_job_application",
              onTap: () =>  Get.to(()=> const CreateNewJobApplicationScreen())),
    );
  }
}



