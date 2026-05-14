import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:percent_indicator/percent_indicator.dart';



class DashboardHeadingWidget extends StatelessWidget {
  const DashboardHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomContainer(verticalPadding: 20, horizontalPadding: 20,
      child: Row(spacing: Dimensions.paddingSizeSmall, children: [
        CircularPercentIndicator(
            percent: .90,
            circularStrokeCap: CircularStrokeCap.round,
            lineWidth: 10,
            center: Text("90%"),
            progressColor: systemPrimaryColor(),
            radius: 35),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("we_have_built_a_resume_based_on_your_profile".tr,
                style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
            Text("${"last_updated_date".tr} : ${"20 Jan 2025"}", style: textRegular.copyWith()),
          ],),
        ),



        IntrinsicWidth(
          child: CustomButton(onTap: (){

          }, text: "view_profile".tr,
              iconPosition: IconPosition.right,
              fontSize: Dimensions.fontSizeExtraSmall,
              icon: Icon(Icons.remove_red_eye_outlined, size: 18,
                  color: Colors.white)),
        ),

      ]),
    );
  }
}
