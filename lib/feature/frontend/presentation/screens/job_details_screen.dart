
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/frontend/presentation/widgets/job_details/company_info_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/job_details/job_report_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/job_details/job_summery_section.dart';
import 'package:job/feature/frontend/presentation/widgets/job_details/requirements_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/job_details/title_section.dart';
import 'package:job/util/dimensions.dart';

class JobDetailsScreen extends StatefulWidget {
  final String slug;
  const JobDetailsScreen({super.key, required this.slug});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    Get.find<LandingPageController>().getLandingJobDetails(widget.slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController,
      child: GetBuilder<LandingPageController>(builder: (controller) {
        return Center(
          child: SizedBox(width: Dimensions.webMaxWidth,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 20, children: [
              SizedBox(height: Dimensions.paddingSizeDefault),

              JobDetailsTitleSection(),

              JobSummerySection(),

              RequirementsWidget(),

              CompanyInfoWidget(),

              JobReportWidget(),


            ]),
          ),
        );
      }
      ),
    );
  }
}
