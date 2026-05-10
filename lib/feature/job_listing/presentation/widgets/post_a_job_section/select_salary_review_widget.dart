import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/authentication/logic/authentication_controller.dart';
import 'package:mighty_job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class SelectionSalaryWidget extends StatelessWidget {
  const SelectionSalaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobListingController>(
        builder: (controller) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("salary_review".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),),
            SizedBox(height: 34,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index){
                    final salaryReview = controller.salaryReview[index];
                    bool isSelected = salaryReview == controller.selectedSalaryReview;
                    return CustomContainer(color: isSelected? systemPrimaryColor() : null,
                        verticalPadding: 0, borderRadius : 5, showShadow: false,
                        horizontalPadding: Dimensions.paddingSizeLarge,
                        border: Border.all(color: systemPrimaryColor(), width: .5),
                        onTap: (){
                          controller.selectSalaryReview(salaryReview);
                        },
                        child: Center(
                          child: Text(salaryReview.tr, style: textRegular.copyWith(color:
                          isSelected? Colors.white: systemPrimaryColor())),
                        ));
                  }, separatorBuilder: (_, index){
                return SizedBox(width: Dimensions.paddingSizeSmall);
              }, itemCount: controller.salaryReview.length),
            ),
          ],
          );
        }
    );
  }
}


