import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/report_management/logic/report_controller.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      builder: (controller) {
        final recentActivity =
            controller.dashboardReportModel?.data?.recentActivity ?? [];

        final icons = [
          Icons.calendar_today_outlined,
          Icons.send_outlined,
          Icons.cancel_outlined,
          Icons.send_outlined,
          Icons.calendar_today_outlined,
        ];

        final colors = [
          const Color(0xFF8B5CF6),
          const Color(0xFF3B82F6),
          const Color(0xFFEF4444),
          const Color(0xFFF59E0B),
          const Color(0xFF10B981),
        ];

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: CustomContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            Text('recent_activity'.tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),

            const SizedBox(height: 24),

            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(recentActivity.length, (i) {
                      final activity = recentActivity[i];

                      final color = colors[i % colors.length];
                      final icon = icons[i % icons.length];

                      return Expanded(
                        child: Row(children: [
                            Expanded(child: Column(children: [
                              Container(width: 42, height: 42,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: color.withValues(alpha: 0.12)),
                                    child: Icon(icon, size: 18, color: color)),

                                  const SizedBox(height: 10),

                                  Text(activity.message ?? '',
                                    textAlign: TextAlign.center,
                                    style: textRegular.copyWith()),

                                  const SizedBox(height: 4),

                                  Text(activity.time ?? '',
                                    textAlign: TextAlign.center,
                                    style: textRegular.copyWith()),
                                ],
                              ),
                            ),

                            if (i < recentActivity.length - 1)
                              Expanded(child: Container(height: 2,
                                  margin: const EdgeInsets.only(bottom: 52),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(100))),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}