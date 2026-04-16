import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/job_listing_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectJobListingWidget extends StatefulWidget {
  const SelectJobListingWidget({super.key});

  @override
  State<SelectJobListingWidget> createState() => _SelectJobListingWidgetState();
}

class _SelectJobListingWidgetState extends State<SelectJobListingWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "job_listing", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<JobListingController>(initState: (_) {
        if (Get.find<JobListingController>().listingModel == null) {
          Get.find<JobListingController>().getJobListingList(1);
        }
      },
        builder: (jobListingController) {
          return DropdownSearch<JobListingItem>(
            selectedItem: jobListingController.selectedJobListingItem,
            itemLabel: (item) => item.jobTitle ?? "",
            searchController: searchController,
            onSearch: (val) {
              jobListingController.getJobListingList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: JobListingListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
