import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job/public_job_category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/job_category/domain/models/job_category_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class SelectPublicJobCategoryWidget extends StatefulWidget {
  const SelectPublicJobCategoryWidget({super.key});

  @override
  State<SelectPublicJobCategoryWidget> createState() => _SelectPublicJobCategoryWidgetState();
}

class _SelectPublicJobCategoryWidgetState extends State<SelectPublicJobCategoryWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(initState: (_) {
      if (Get.find<LandingPageController>().publicJobCategoryModel == null) {
        Get.find<LandingPageController>().getLandingJobCategoryList(1);
      }
    },
      builder: (jobCategoryController) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text("job_category".tr, style: textRegular),
            ),
            DropdownSearch<JobCategoryItem>(
              hintText: 'select_job_category'.tr,
              selectedItem: jobCategoryController.selectedJobCategoryItem,
              itemLabel: (item) => item.name ?? "",
              searchController: searchController,
              onSearch: (val) {
                jobCategoryController.getLandingIndustryList(1, search: val.trim());
              },
              listWidgetBuilder: () => SingleChildScrollView(
                  child: PublicJobCategoryListWidget(fromFilter: true,
                      scrollController: scrollController)),
            ),
          ],
        );
      },
    );
  }
}
