
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/common/widget/custom_bottom_navigation_button.dart';
import 'package:mighty_job/feature/job_category/controller/job_category_controller.dart';
import 'package:mighty_job/feature/job_category/presentation/screens/create_new_job_category_screen.dart';
import 'package:mighty_job/feature/job_category/presentation/widgets/job_category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class JobCategoryScreen extends StatefulWidget {
  const JobCategoryScreen({super.key});

  @override
  State<JobCategoryScreen> createState() => _JobCategoryScreenState();
}

class _JobCategoryScreenState extends State<JobCategoryScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "job_category".tr),
      body: RefreshIndicator(onRefresh: () async {
          await Get.find<JobCategoryController>().getJobCategoryList(1);
        },
        child: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: JobCategoryListWidget(scrollController: scrollController))
        ],),
      ),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "add_new_job_category",
              onTap: () =>  Get.to(()=> const CreateNewJobCategoryScreen())),
    );
  }
}



