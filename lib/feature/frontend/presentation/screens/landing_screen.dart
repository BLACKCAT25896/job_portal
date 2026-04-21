
import 'package:mighty_job/common/layout/base_layout.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/hero_section_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/industry/public_industry_list_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job/public_job_category_list_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job/public_job_listing_list_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/post/public_post_category_list_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/post/public_post_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return BaseLayout(scrollController: scrollController,
      child: GetBuilder<LandingPageController>(builder: (controller) {
        return Column(spacing: 20, children: [
          HeroSectionWidget(),

          if(controller.isCategorySelected)...[
            PublicJobCategoryListWidget(scrollController: scrollController),
          ]else...[
            PublicIndustryListWidget(scrollController: scrollController),
          ],

          PublicJobListingListWidget(scrollController: scrollController),
          PublicPostCategoryListWidget(scrollController: scrollController),
          PublicPostListWidget(scrollController: scrollController),

        ]);
      }
      ),
    );
  }
}



