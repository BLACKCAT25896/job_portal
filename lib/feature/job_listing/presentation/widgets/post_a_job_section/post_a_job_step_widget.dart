import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class PostAJobStepWidget extends StatefulWidget {
  const PostAJobStepWidget({super.key});

  @override
  State<PostAJobStepWidget> createState() => _PostAJobStepWidgetState();
}

class _PostAJobStepWidgetState extends State<PostAJobStepWidget> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 300,
      child: GetBuilder<JobListingController>(builder: (controller) {
        final steps = controller.steps;
          return CustomContainer(borderRadius: 8,
            child: Column(children: [

                ListView.separated(
                  itemCount: steps.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(height: Dimensions.paddingSizeSmall),
                  itemBuilder: (context, index) {
                    final item = steps[index];
                    return CustomContainer(width: 300, showShadow: false, borderRadius: 8,
                      onTap: () {
                        controller.selectStep(index);
                      },
                      color: item.isActive? systemPrimaryColor() : Colors.transparent,
                      horizontalPadding: Dimensions.paddingSizeDefault,
                      verticalPadding: Dimensions.paddingSizeDefault,
                      border: Border.all(width: .25, color: Theme.of(context).hintColor),
                      child: Row(children: [

                        Container(height: 40, width: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                              color: item.isActive? Theme.of(context).cardColor.withValues(alpha: .1) :
                              systemPrimaryColor().withValues(alpha: .08)),
                            child: Icon(item.icon, size: 20, color: item.isActive? Colors.white : systemPrimaryColor())),

                        const SizedBox(width: Dimensions.paddingSizeDefault),
                        Expanded(child: Text(item.title.tr,
                            style: textMedium.copyWith(
                              color: item.isActive? Colors.white : Theme.of(context).hintColor,
                                fontSize: Dimensions.fontSizeLarge))),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: Dimensions.paddingSizeLarge),
                CustomButton(onTap: () {

                }, text: "publish_this_job".tr),
              ],
            ),
          );
        }
      ),
    );
  }
}
