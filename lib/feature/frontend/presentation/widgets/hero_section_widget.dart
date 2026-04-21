import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/industry/select_public_industry_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job_search_header_widget.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:get/get.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomImage(image: Images.heroBg, isLocalAsset: true,),
        Center(child: SizedBox(width: Dimensions.webMaxWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Dimensions.paddingSizeDefault, children: [
                Text("find_the_right_job".tr,
                    style: landingTextStyle(context).copyWith(fontSize: Dimensions.fontSizeHeading)),
                ResponsiveMasonryGrid(children: [
                  CountingItemWidget(title: "live_jobs".tr, count: 100),
                  CountingItemWidget(title: "vacancies".tr, count: 100),
                  CountingItemWidget(title: "companies".tr, count: 100),
                  CountingItemWidget(title: "new_jobs".tr, count: 100),
                ]),
                CustomContainer(color: systemPrimaryColor(),
                  showShadow: false, horizontalPadding: Dimensions.paddingSizeLarge,
                  verticalPadding: Dimensions.paddingSizeLarge,
                  child: Row(spacing: Dimensions.paddingSizeDefault, children: [
                    Expanded(child: JobSearchHeaderWidget()),
                    Expanded(child: SelectPublicIndustryWidget()),
                    SizedBox(width: 120, child: CustomButton(height: 45,
                      buttonColor: Theme.of(context).primaryColor,
                        onTap: (){}, text: "search".tr))

                  ]),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}

class CountingItemWidget extends StatelessWidget {
  final String title;
  final int count;
  const CountingItemWidget({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeSmall, children: [
      CustomContainer(borderRadius: 123,
          border: Border.all(color: systemPrimaryColor(), width: 2),
          horizontalPadding: 3,verticalPadding: 3,
          child: CustomContainer(borderRadius: 123,
              color: systemPrimaryColor(),
              width: 50, height: 50,child: CustomImage(radius: 123))),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title.toUpperCase(), style: textRegular),
        Text(count.toString(),
            style: textBold.copyWith(fontSize: Dimensions.paddingSizeDefault)),

      ]))
    ]);
  }
}
