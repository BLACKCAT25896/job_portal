import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/job_application/controller/job_application_controller.dart';
import 'package:mighty_job/feature/job_application/domain/models/job_application_model.dart';
import 'package:mighty_job/feature/job_application/presentation/widgets/job_application_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectJobApplicationWidget extends StatefulWidget {
  const SelectJobApplicationWidget({super.key});

  @override
  State<SelectJobApplicationWidget> createState() => _SelectJobApplicationWidgetState();
}

class _SelectJobApplicationWidgetState extends State<SelectJobApplicationWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "job_application", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<JobApplicationController>(initState: (_) {
        if (Get.find<JobApplicationController>().applicationModel == null) {
          Get.find<JobApplicationController>().getJobApplicationList(1);
        }
      },
        builder: (jobApplicationController) {
          return DropdownSearch<JobApplicationItem>(
            selectedItem: jobApplicationController.selectedJobApplicationItem,
            itemLabel: (item) => item.jobListing?.jobTitle ?? "",
            searchController: searchController,
            onSearch: (val) {
              jobApplicationController.getJobApplicationList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: JobApplicationListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
