import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/report_management/logic/report_controller.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class VacancyWidget extends StatelessWidget {
  const VacancyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(builder: (controller) {
      final vacancies = controller.dashboardReportModel?.data?.vacancies ?? [];

      return Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Row(children: [
            Text('Open Vacancies',
              style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),

            const Spacer(),

            TextButton(onPressed: () {},
              child: Text('View All →', style: textRegular.copyWith())),
          ]),

          const SizedBox(height: 20),

          ...List.generate(vacancies.length, (index) {
            final vacancy = vacancies[index];

            final colors = [
              const Color(0xFFEEF2FF),
              const Color(0xFFECFEFF),
              const Color(0xFFF0FDF4),
              const Color(0xFFFFF7ED),
              const Color(0xFFFEF2F2),
            ];

            final iconColors = [
              const Color(0xFF4F46E5),
              const Color(0xFF06B6D4),
              const Color(0xFF10B981),
              const Color(0xFFF59E0B),
              const Color(0xFFEF4444),
            ];

            final bgColor = colors[index % colors.length];
            final iconColor = iconColors[index % iconColors.length];

            return Container(margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200)),
              child: Row(children: [

                Container(width: 48, height: 48,
                  decoration: BoxDecoration(color: bgColor,
                    borderRadius: BorderRadius.circular(14)),
                  child: Icon(Icons.business_center_outlined,
                    color: iconColor, size: 22)),

                const SizedBox(width: 14),

                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(vacancy.company ?? '', maxLines: 1,
                    overflow: TextOverflow.ellipsis, style: textMedium.copyWith()),

                  const SizedBox(height: 5),

                  Text('${vacancy.salary}',
                    style: textRegular.copyWith()),
                ])),

                const SizedBox(width: 12),

                Container(padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10)),
                  child: Text('${vacancy.applications ?? 0}',
                    style: textRegular.copyWith(color: iconColor))),
              ]));
            }),
        ]),
        ));
      },
    );
  }
}