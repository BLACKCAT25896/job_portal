
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/reported_job/controller/reported_job_controller.dart';
import 'package:mighty_job/feature/reported_job/presentation/screens/create_new_reported_job_screen.dart';
import 'package:mighty_job/feature/reported_job/presentation/widgets/reported_job_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ReportedJobScreen extends StatefulWidget {
  const ReportedJobScreen({super.key});

  @override
  State<ReportedJobScreen> createState() => _ReportedJobScreenState();
}

class _ReportedJobScreenState extends State<ReportedJobScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "reported_job".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<ReportedJobController>().getReportedJobList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: ReportedJobListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_reported_job",
              onTap: () =>  Get.to(()=> const CreateNewReportedJobScreen())),
    );
  }
}



