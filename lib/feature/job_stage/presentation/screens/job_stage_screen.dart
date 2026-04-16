
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/job_stage/controller/job_stage_controller.dart';
import 'package:mighty_job/feature/job_stage/presentation/screens/create_new_job_stage_screen.dart';
import 'package:mighty_job/feature/job_stage/presentation/widgets/job_stage_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class JobStageScreen extends StatefulWidget {
  const JobStageScreen({super.key});

  @override
  State<JobStageScreen> createState() => _JobStageScreenState();
}

class _JobStageScreenState extends State<JobStageScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "job_stage".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<JobStageController>().getJobStageList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: JobStageListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_job_stage",
              onTap: () =>  Get.to(()=> const CreateNewJobStageScreen())),
    );
  }
}



