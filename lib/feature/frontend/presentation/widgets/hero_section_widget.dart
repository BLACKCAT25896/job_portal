import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/industry/select_public_industry_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job_listing_summery_widget.dart';
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
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Dimensions.paddingSizeDefault, children: [
                Text("find_the_right_job".tr,
                    style: landingTextStyle(context).copyWith(fontSize: Dimensions.fontSizeHeading)),
                    JobListingSummeryWidget(),
                CustomContainer(color: systemPrimaryColor(),
                  showShadow: false, horizontalPadding: Dimensions.paddingSizeLarge,
                  verticalPadding: Dimensions.paddingSizeLarge,
                  child: Row(spacing: Dimensions.paddingSizeDefault, children: [
                    Expanded(child: JobSearchHeaderWidget()),
                    Expanded(child: SelectPublicIndustryWidget()),
                    SizedBox(width: 120, child: CustomButton(height: 45,
                      buttonColor: Theme.of(context).primaryColor,
                        onTap: (){

                        }, text: "search".tr))

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

