import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job_details/info_richtext_widget.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/date_converter.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
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
              const SizedBox(height: Dimensions.paddingSizeDefault),

              ResponsiveMasonryGrid(
                children: [
                  InfoRichText(label:"vacancy".tr, value: job?.position.toString() ?? "0"),
                  InfoRichText(label:"location".tr, value:job?.company?.location ?? "N/A"),
                  InfoRichText(label:"salary".tr, value: _formatSalary(job?.salaryFrom, job?.salaryTo)),
                  InfoRichText(label:"experience".tr, value: "${job?.experience ?? 0} years"),
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
