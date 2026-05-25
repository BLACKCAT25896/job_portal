import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/gause_painter.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:get/get.dart';

class MonthlyJobApplyLimitWidget extends StatelessWidget {
  const MonthlyJobApplyLimitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return CustomContainer(verticalPadding: Dimensions.paddingSizeDefault,
        horizontalPadding: Dimensions.paddingSizeDefault, child: Row(children: [

          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("${'job_application_limit'.tr}: ", style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

              const SizedBox(height: 12),
              SizedBox(width: 120, height: 70,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  CustomPaint(size: const Size(120, 70), painter: GaugePainter(value: 0, max: 75)),

                  Positioned(bottom: 0,
                    child: Column(children: [
                      Text('Monthly', style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                      Text('0 / 75', style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                    ],
                    ),
                  ),
                ],
                ),
              ),
            ],
            ),
          ),

          Column(spacing: Dimensions.paddingSizeDefault,
              crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(isDesktop?"get_pro_and_buy_more_applications_anytime".tr : "upgrade_to_pro".tr),
                IntrinsicWidth(
                  child: CustomButton(
                      buttonColor: Theme.of(context).cardColor,
                      borderColor: systemPrimaryColor(),
                      textColor: systemPrimaryColor(),
                      onTap: (){

                      }, text: "buy_more_applications".tr),
                )
              ])

        ]));
  }
}
