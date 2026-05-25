

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/base_layout.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_search.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/frontend/presentation/widgets/industry/public_industry_list_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/job/public_job_category_list_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/job/public_job_listing_list_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/job_filter_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';

class CategoryOrIndustryWiseJobListWidget extends StatefulWidget {
  final String slug;
  final String type;
  final String? categoryId;
  final String? industryId;
  const CategoryOrIndustryWiseJobListWidget({super.key, required this.slug,
    required this.type, this.categoryId, this.industryId});

  @override
  State<CategoryOrIndustryWiseJobListWidget> createState() => _CategoryOrIndustryWiseJobListWidgetState();
}

class _CategoryOrIndustryWiseJobListWidgetState extends State<CategoryOrIndustryWiseJobListWidget> {
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Get.find<LandingPageController>().getLandingJobListingList(1, jobCategoryId: widget.categoryId);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    BaseLayout(scrollController: scrollController,
        child: GetBuilder<LandingPageController>(builder: (controller) {
          return Padding(padding: EdgeInsets.only(top: Dimensions.paddingSizeDefault),
            child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Dimensions.paddingSizeDefault, children: [
                    SizedBox(width: 190, child: Column(mainAxisSize: MainAxisSize.min,
                      spacing: Dimensions.paddingSizeSmall, children: [
                        CustomSearch(hintText: "search_for_job".tr,
                            searchController: searchController),

                        JobFilterWidget(),

                        PublicJobCategoryListWidget(fromFilter: true, scrollController: scrollController),
                        PublicIndustryListWidget(fromFilter: true, scrollController: scrollController)
                      ],
                    )),

                    Expanded(child: PublicJobListingListWidget(fromFilter: true, scrollController: scrollController)),
                    ],
                  ))),
            );
          }
        )): Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
          PublicJobListingListWidget(fromFilter: true, scrollController: scrollController),
        ]),)
      ]),

    );
  }
}
