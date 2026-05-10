import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class SelectionBenefitWidget extends StatelessWidget {
  const SelectionBenefitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobListingController>(builder: (controller) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

        Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("compensations_and_benefits".tr,
            style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                fontWeight: FontWeight.w600))),


        Wrap(spacing: 10, runSpacing: 12,
          children: List.generate(controller.benefits.length, (index) {
            final benefit = controller.benefits[index];

            return GestureDetector(onTap: () {
              benefit.isSelected = !(benefit.isSelected ?? false);
              controller.update();
              }, child: CustomContainer(color: (benefit.isSelected ?? false) ? systemPrimaryColor() : Colors.white,
              verticalPadding: 10,
              horizontalPadding: 14,
              borderRadius: 8,
              showShadow: false,
              border: Border.all(color: (benefit.isSelected ?? false) ?
              systemPrimaryColor() : Colors.grey.shade300, width: 1),
              child: Text(benefit.title,
                style: textRegular.copyWith(color: (benefit.isSelected ?? false)
                    ? Colors.white : Colors.black87,
                  fontSize: Dimensions.fontSizeDefault),
              )),
            );
            }),
        ),
      ]);
      },
    );
  }
}