import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/base_layout.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job_details/title_section.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class JobDetailsScreen extends StatefulWidget {
  final String slug;
  const JobDetailsScreen({super.key, required this.slug});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    Get.find<LandingPageController>().getLandingJobDetails(widget.slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("id===>${widget.slug}");
    return BaseLayout(scrollController: scrollController,
      child: GetBuilder<LandingPageController>(builder: (controller) {
        final model = controller.jobDetailsModel;
        final data = model?.data;
        final job = data?.job;
        return Center(
          child: SizedBox(width: Dimensions.webMaxWidth,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 20, children: [
              SizedBox(height: Dimensions.paddingSizeDefault),

              JobDetailsTitleSection(),

              CustomContainer(borderRadius: 5,
                  child: Column(spacing: Dimensions.paddingSizeDefault,
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("summery", style: textBold.copyWith(
                    fontSize: Dimensions.fontSizeExtraLarge,color: systemPrimaryColor())),

                ResponsiveMasonryGrid(children: [
                  Text("${"vacancy".tr}: ${2}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                  Text("${"location".tr}: ${"ManikGanj"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                  Text("${"salary".tr}: ${"Negotiable"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                  Text("${"experience".tr}: ${"1-2 years"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                  Text("${"published".tr}: ${"21 April 2026"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                ]),

              ])),

              CustomContainer(borderRadius: 5,width: Dimensions.webMaxWidth,
                  child: Column(spacing: Dimensions.paddingSizeDefault,
                      crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text("requirements", style: textBold.copyWith(
                            fontSize: Dimensions.fontSizeExtraLarge,color: systemPrimaryColor())),

                        Text("education", style: textSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeLarge)),
                        Text("যেকোনো বিষয়ে স্নাতক ডিগ্রি সম্পন্ন প্রার্থীদের অগ্রাধিকার দেওয়া হবে।",style: textRegular),

                        Text("experience", style: textSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeLarge)),
                        Text("1 to 2 years",style: textRegular),

                        Text("additional_requirement", style: textSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeLarge)),
                        Text("1 to 2 years",style: textRegular),


                        Text("responsibilities_and_context", style: textSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeLarge)),
                        Text("1 to 2 years",style: textRegular),

                        Text("compansion_and_other_benefit", style: textSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeLarge)),
                        Text("1 to 2 years",style: textRegular),

                        Text("workplace", style: textSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeLarge)),
                        Text("1 to 2 years",style: textRegular),


                        Text("employment_status", style: textSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeLarge)),
                        Text("1 to 2 years",style: textRegular),


                        Text("lob_location", style: textSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeLarge)),
                        Text("1 to 2 years",style: textRegular),



                      ])),

              CustomContainer(borderRadius: 5,
                  child: Column(spacing: Dimensions.paddingSizeDefault,
                      crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text("company_info", style: textBold.copyWith(
                            fontSize: Dimensions.fontSizeExtraLarge,color: systemPrimaryColor())),

                        ResponsiveMasonryGrid(children: [
                          Text("${"vacancy".tr}: ${2}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                          Text("${"location".tr}: ${"ManikGanj"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                          Text("${"salary".tr}: ${"Negotiable"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                          Text("${"experience".tr}: ${"1-2 years"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                          Text("${"published".tr}: ${"21 April 2026"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                        ]),

                      ])),

              CustomContainer(borderRadius: 5,
                  child: Column(spacing: Dimensions.paddingSizeDefault,
                      crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text("report_this_job_or_company", style: textBold.copyWith(
                            fontSize: Dimensions.fontSizeExtraLarge,color: systemPrimaryColor())),

                        ResponsiveMasonryGrid(children: [
                          Text("${"vacancy".tr}: ${2}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                          Text("${"location".tr}: ${"ManikGanj"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                          Text("${"salary".tr}: ${"Negotiable"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                          Text("${"experience".tr}: ${"1-2 years"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                          Text("${"published".tr}: ${"21 April 2026"}", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                        ]),

                      ])),


            ]),
          ),
        );
      }
      ),
    );
  }
}
