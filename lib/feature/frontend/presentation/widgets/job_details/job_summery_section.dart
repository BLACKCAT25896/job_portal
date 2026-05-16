import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/frontend/presentation/widgets/job_details/info_richtext_widget.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/helper/date_converter.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:get/get.dart';

class JobSummerySection extends StatelessWidget {
  const JobSummerySection({super.key});

  String _formatSalary(dynamic from, dynamic to) {
    if (from == null && to == null) return "N/A";
    return "${from ?? 0} - ${to ?? 0}";
  }

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return "N/A";
    try {
      return DateConverter.quotationDateAndTime(DateTime.parse(date));
    } catch (_) {
      return "N/A";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(builder: (controller) {
        final job = controller.jobDetailsModel?.data?.job;

        return CustomContainer(borderRadius: 5,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("summary".tr, style: textBold.copyWith(
                  fontSize: Dimensions.fontSizeExtraLarge,
                  color: systemPrimaryColor())),
               SizedBox(height: Dimensions.paddingSizeDefault),

              ResponsiveMasonryGrid(
                children: [
                  InfoRichText(label:"vacancy".tr, value: job?.vacancies.toString() ?? "0"),
                  InfoRichText(label:"location".tr, value:job?.company?.location ?? "N/A"),
                  InfoRichText(label:"salary".tr, value: _formatSalary(job?.salaryFrom, job?.salaryTo)),
                  InfoRichText(label:"experience".tr, value: "${job?.minExperience ?? 0} - ${"${job?.maxExperience ?? 0} years"}"),
                  InfoRichText(label:"published".tr, value: _formatDate(job?.createdAt)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}
