
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/web_custom_search_widget.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class JobSearchHeaderWidget extends StatefulWidget {
  const JobSearchHeaderWidget({super.key});

  @override
  State<JobSearchHeaderWidget> createState() => _JobSearchHeaderWidgetState();
}

class _JobSearchHeaderWidgetState extends State<JobSearchHeaderWidget> {
  @override
  void initState() {
    Get.find<LandingPageController>().getLandingJobListingList(1);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(builder: (controller) {
      final jobModel= controller.publicJobListingModel;
      final items = jobModel?.data?.data;
      return SizedBox(height: 50,
        child: TypewriterSearchField<JobListingItem>(
          hint: "search_job".tr,
          items: items??[],
          itemBuilder: (item) => Padding(
            padding: const EdgeInsets.all(10),
            child: Row(spacing: Dimensions.paddingSizeSmall, children: [


              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item.jobTitle ?? '', style: textMedium.copyWith()),
                Text(item.companyName??'', style: textRegular),
              ])),
            ])),
            onItemSelected: (item) {
              //Get.toNamed(RouteHelper.getJobDetailsRoute(item.slug!));
            },
            onChanged: (text) {
              //Get.find<JobController>().getJobList(1, search: text);
            }, searchText: (item) => item.jobTitle ?? '',
          ),
        );
      }
    );
  }
}
