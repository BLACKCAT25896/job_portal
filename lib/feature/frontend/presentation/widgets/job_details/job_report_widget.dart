import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:get/get.dart';

class JobReportWidget extends StatelessWidget {
  const JobReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(borderRadius: 5,
        child: Column(spacing: Dimensions.paddingSizeDefault,
            crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: Text("report_this_job_or_company".tr, style: textBold.copyWith(
                        fontSize: Dimensions.fontSizeExtraLarge,color: systemPrimaryColor())),
                  ),
                  IntrinsicWidth(
                    child: CustomButton( borderColor: Theme.of(context).colorScheme.error,
                      showBorderOnly: true, borderWidth: 1,
                      textColor: Theme.of(context).colorScheme.error,
                      icon: Icon(Icons.warning_amber, color: Theme.of(context).colorScheme.error,),
                      onTap: (){},
                      text: "report_this_job".tr,

                    ),
                  )
                ],
              ),

              Text("If the advertiser or organization offering this job asks you for any money, or if any form of harassment (physical or mental) occurs during the recruitment process, please inform us immediately or report the job. Do not pay any person or organization to get a job. If there is any possibility of harassment (physical or mental) during employment, do not join that position. BDjobs will not take responsibility for any financial transactions or harassment by the employer.",
                  style: textRegular.copyWith()),


            ]));
  }
}
