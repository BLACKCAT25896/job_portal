import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/reported_job/controller/reported_job_controller.dart';
import 'package:mighty_job/feature/reported_job/domain/models/reported_job_model.dart';
import 'package:mighty_job/feature/reported_job/presentation/widgets/reported_job_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectReportedJobWidget extends StatefulWidget {
  const SelectReportedJobWidget({super.key});

  @override
  State<SelectReportedJobWidget> createState() => _SelectReportedJobWidgetState();
}

class _SelectReportedJobWidgetState extends State<SelectReportedJobWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "reported_job", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<ReportedJobController>(initState: (_) {
        if (Get.find<ReportedJobController>().reportedJobModel == null) {
          Get.find<ReportedJobController>().getReportedJobList(1);
        }
      },
        builder: (jobListingController) {
          return DropdownSearch<ReportedJobItem>(
            selectedItem: jobListingController.selectedReportedJobItem,
            itemLabel: (item) => item.note ?? "",
            searchController: searchController,
            onSearch: (val) {
              jobListingController.getReportedJobList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: ReportedJobListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
