import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class JobListingSummeryWidget extends StatelessWidget {
  const JobListingSummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(
      initState: (value){
        Get.find<LandingPageController>().getLandingJobSummery();
      },
      builder: (controller) {
        final model = controller.jobListingSummeryModel;
        final data = model?.data;
        return ResponsiveMasonryGrid(children: [
          CountingItemWidget(title: "live_jobs".tr, count: data?.liveJobs??0, image: Images.lifeline,),
          CountingItemWidget(title: "vacancies".tr, count: data?.vacancies??0, image: Images.vacancy,),
          CountingItemWidget(title: "companies".tr, count: data?.companies??0, image: Images.company,),
          CountingItemWidget(title: "new_jobs".tr, count: data?.newJobs??0, image: Images.newJob,),
        ]);
      }
    );
  }
}
class CountingItemWidget extends StatelessWidget {
  final String title;
  final int count;
  final String image;
  const CountingItemWidget({super.key, required this.title, required this.count, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeSmall, children: [
      CustomContainer(borderRadius: 123,
          border: Border.all(color: systemPrimaryColor(), width: 2),
          horizontalPadding: 3,verticalPadding: 3,
          child: CustomContainer(borderRadius: 123,
              color: systemPrimaryColor(),
              width: 50, height: 50,child: CustomImage(isLocalAsset: true,
                  svgColor: Colors.white,
                  image: image, width: 20,
                  radius: 123))),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title.toUpperCase(), style: textRegular),
        Text(count.toString(),
            style: textBold.copyWith(fontSize: Dimensions.fontSizeHeading)),

      ]))
    ]);
  }
}
