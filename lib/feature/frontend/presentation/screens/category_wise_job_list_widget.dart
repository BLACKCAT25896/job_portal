

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/base_layout.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/custom_range_slider_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/industry/public_industry_list_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job/public_job_category_list_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job/public_job_listing_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class CategoryOrIndustryWiseJobListWidget extends StatefulWidget {
  final String slug;
  final String type;
  const CategoryOrIndustryWiseJobListWidget({super.key, required this.slug, required this.type});

  @override
  State<CategoryOrIndustryWiseJobListWidget> createState() => _CategoryOrIndustryWiseJobListWidgetState();
}

class _CategoryOrIndustryWiseJobListWidgetState extends State<CategoryOrIndustryWiseJobListWidget> {
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController,
        child: GetBuilder<LandingPageController>(builder: (controller) {
            return Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
              child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: Dimensions.paddingSizeDefault, children: [
                      SizedBox(width: 190, child: Column(mainAxisSize: MainAxisSize.min,
                        spacing: Dimensions.paddingSizeSmall, children: [
                          CustomSearch(hintText: "search_for_job".tr,
                              searchController: searchController),

                          CustomContainer(
                            borderRadius: 5,
                            showShadow: false,
                            child: Column(
                              children: [

                                CustomRangeSlider(
                                  values: controller.salaryRange,
                                  title: "salary_range",
                                  min: 0,
                                  max: 100,
                                  divisions: 10,
                                  onChanged: (values) {
                                    controller.updateSalaryRange(values);
                                  },
                                ),

                                CustomRangeSlider(
                                  values: controller.ageRange,
                                  title: "age_range",
                                  min: 0,
                                  max: 100,
                                  divisions: 10,
                                  onChanged: (values) {
                                    controller.updateAgeRange(values);
                                  },
                                ),

                                CustomRangeSlider(
                                  values: controller.experienceRange, // ✅ FIXED
                                  title: "experience_range",
                                  min: 0,
                                  max: 100,
                                  divisions: 10,
                                  onChanged: (values) {
                                    controller.updateExperienceRange(values);
                                  },
                                ),

                              ],
                            ),
                          ),

                          PublicJobCategoryListWidget(fromFilter: true,
                              scrollController: scrollController),
                          PublicIndustryListWidget(fromFilter: true,
                              scrollController: scrollController)
                        ],
                      )),

                      Expanded(child: PublicJobListingListWidget(fromFilter: true,
                          scrollController: scrollController)),
                    ],
                  ))),
            );
          }
        ));
  }
}
