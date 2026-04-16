
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:mighty_job/feature/job_listing/presentation/screens/create_new_job_listing_screen.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/job_listing_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class JobListingScreen extends StatefulWidget {
  const JobListingScreen({super.key});

  @override
  State<JobListingScreen> createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<JobListingScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "job_listing".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<JobListingController>().getJobListingList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: JobListingListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_job_listing",
              onTap: () =>  Get.to(()=> const CreateNewJobListingScreen())),
    );
  }
}



