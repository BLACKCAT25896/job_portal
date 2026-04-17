import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/job_category/controller/job_category_controller.dart';
import 'package:mighty_job/feature/job_category/domain/models/job_category_model.dart';
import 'package:mighty_job/feature/job_category/presentation/widgets/job_category_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectJobCategoryWidget extends StatefulWidget {
  const SelectJobCategoryWidget({super.key});

  @override
  State<SelectJobCategoryWidget> createState() => _SelectJobCategoryWidgetState();
}

class _SelectJobCategoryWidgetState extends State<SelectJobCategoryWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "job_category", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<JobCategoryController>(initState: (_) {
        if (Get.find<JobCategoryController>().categoryModel == null) {
          Get.find<JobCategoryController>().getJobCategoryList(1);
        }
      },
        builder: (jobCategoryController) {
          return DropdownSearch<JobCategoryItem>(
            selectedItem: jobCategoryController.selectedJobCategoryItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              jobCategoryController.getJobCategoryList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: JobCategoryListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
