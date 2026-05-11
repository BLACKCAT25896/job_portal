import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/report_management/logic/report_controller.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class HiringPipelineWidget extends StatelessWidget {
  const HiringPipelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      builder: (controller) {
        final pipeline = controller.dashboardReportModel?.data?.pipeline;

        final stages = [
          {
            'label': 'applied'.tr,
            'value': (pipeline?.applied ?? 0).toDouble(),
            'color': const Color(0xFF4F46E5),
          },
          {
            'label': 'shortlisted'.tr,
            'value': (pipeline?.shortlisted ?? 0).toDouble(),
            'color': const Color(0xFFF59E0B),
          },
          {
            'label': 'interview'.tr,
            'value': (pipeline?.interview ?? 0).toDouble(),
            'color': const Color(0xFF8B5CF6),
          },
          {
            'label': 'final_interview'.tr,
            'value': (pipeline?.finalInterview ?? 0).toDouble(),
            'color': const Color(0xFF06B6D4),
          },
          {
            'label': 'hired'.tr,
            'value': (pipeline?.hired ?? 0).toDouble(),
            'color': const Color(0xFF10B981),
          },
        ];

        final maxValue = stages.map((e) => e['value'] as double).reduce((a, b) => a > b ? a : b);

        return Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
             Text('hiring_pipeline'.tr, style: textSemiBold.copyWith(
                 fontSize: Dimensions.fontSizeExtraLarge)),

            const SizedBox(height: 4),
            Text('current_funnel_conversion'.tr,
                style: textRegular.copyWith(color: Theme.of(context).hintColor)),

            const SizedBox(height: 24),

            ...stages.map((stage) {
              final value = stage['value'] as double;
              final color = stage['color'] as Color;

              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(stage['label'] as String,
                      style: textRegular.copyWith()),

                    Text('${value.toStringAsFixed(0)}%', style: textRegular.copyWith(color: color)),
                  ]),

                  const SizedBox(height: 8),

                  ClipRRect(borderRadius: BorderRadius.circular(100),
                    child: LinearProgressIndicator(value: value / maxValue,
                      minHeight: 8, backgroundColor: const Color(0xFFE5E7EB),
                      valueColor: AlwaysStoppedAnimation<Color>(color)),
                  ),
                ]));
              }),
              ],
            ),
          ),
        );
      },
    );
  }
}