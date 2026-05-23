import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/global_widget/header_logo_section.dart';
import 'package:job/common/widget/custom_app_bar.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/frontend/presentation/widgets/company/public_company_list_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/hero_section_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/industry/public_industry_list_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/job/public_job_category_list_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/job/public_job_listing_list_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/post/public_post_category_list_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/post/public_post_list_widget.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/helper/route_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class MobileAppLandingScreen extends StatefulWidget {
  const MobileAppLandingScreen({super.key});

  @override
  State<MobileAppLandingScreen> createState() => _MobileAppLandingScreenState();
}

class _MobileAppLandingScreenState extends State<MobileAppLandingScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    route();
  }

  Future<void> route() async {
    Future.delayed(Duration(microseconds: 1), (){
      if(Get.find<AuthenticationController>().isLoggedIn()){
        Get.offNamed(RouteHelper.getDashboardRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleWidget: Row(children: [
        SizedBox(height: 30, child: HeaderLogoSection()),
        Spacer(),
        if(!Get.find<AuthenticationController>().isLoggedIn())
        CustomContainer(onTap: (){
          Get.toNamed(RouteHelper.getLoginRoute());
        },
            verticalPadding: 5,borderRadius: 5,showShadow: false,
            child: Text("login".tr, style: textRegular.copyWith(color: systemPrimaryColor())))
      ])),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: GetBuilder<LandingPageController>(
          builder: (controller) {
            return Column(spacing: Dimensions.paddingSizeDefault, children: [

              HeroSectionWidget(),
              if(controller.isCategorySelected)...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                  child: PublicJobCategoryListWidget(scrollController: scrollController),
                ),
              ]else...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                  child: PublicIndustryListWidget(scrollController: scrollController),
                ),
              ],
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: PublicCompanyListWidget(scrollController: scrollController),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: PublicJobListingListWidget(scrollController: scrollController),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: PublicPostCategoryListWidget(scrollController: scrollController),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: PublicPostListWidget(scrollController: scrollController),
              ),

            ]);
          }
        ),)
      ]),
    );
  }
}
