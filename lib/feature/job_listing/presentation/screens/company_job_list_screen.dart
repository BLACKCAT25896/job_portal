
import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_bottom_navigation_button.dart';
import 'package:job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:job/feature/job_listing/presentation/screens/post_a_job_screen.dart';
import 'package:job/feature/job_listing/presentation/widgets/company_job_list_widget.dart';
import 'package:job/feature/job_listing/presentation/widgets/job_listing_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CompanyJobListingScreen extends StatefulWidget {
  const CompanyJobListingScreen({super.key});

  @override
  State<CompanyJobListingScreen> createState() => _CompanyJobListingScreenState();
}

class _CompanyJobListingScreenState extends State<CompanyJobListingScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "job_list".tr),
      body: BaseLayout(scrollController: scrollController,
          child: CompanyJobListingListWidget(scrollController: scrollController)),

      bottomNavigationBar :
          CustomBottomNavigationButton(title: "post_new_job",
              onTap: () =>  Get.to(()=> const PostAJobScreen())),
    );
  }
}



