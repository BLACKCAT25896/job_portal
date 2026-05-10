import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class SelectionLunchWidget extends StatelessWidget {
  const SelectionLunchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobListingController>(
        builder: (controller) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("launch_facility".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),),
            SizedBox(height: 34,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index){
                    final lunchFacility = controller.lunchFacility[index];
                    bool isSelected = lunchFacility == controller.selectedLunchFacility;
                    return CustomContainer(color: isSelected? systemPrimaryColor() : null,
                        verticalPadding: 0, borderRadius : 5, showShadow: false,
                        horizontalPadding: Dimensions.paddingSizeLarge,
                        border: Border.all(color: systemPrimaryColor(), width: .5),
                        onTap: (){
                          controller.selectLunchFacility(lunchFacility);
                        },
                        child: Center(
                          child: Text(lunchFacility.tr, style: textRegular.copyWith(color:
                          isSelected? Colors.white: systemPrimaryColor())),
                        ));
                  }, separatorBuilder: (_, index){
                return SizedBox(width: Dimensions.paddingSizeSmall);
              }, itemCount: controller.lunchFacility.length),
            ),
          ],
          );
        }
    );
  }
}


