import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/report_management/logic/report_controller.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class CategoryWiseChart extends StatelessWidget {
  const CategoryWiseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: _buildBarChart(),
    );
  }
  Widget _buildBarChart() {
    return CustomContainer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
               Text('applications_by_category', style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge) ),
              const Spacer(),
              _Chip(label: 'This Year', color: systemPrimaryColor()),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 320,
            child: _CategoryBarChart(),
          ),
        ],
      ),
    );
  }
}


class _Chip extends StatelessWidget {
  final String label;
  final Color color;
  const _Chip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: textRegular.copyWith(color: color)),
    );
  }
}


class _CategoryBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final barColors = [
      const Color(0xFF4F46E5),
      const Color(0xFF06B6D4),
      const Color(0xFF10B981),
      const Color(0xFFF59E0B),
      const Color(0xFFEF4444),
      const Color(0xFF8B5CF6),
      const Color(0xFFEC4899),
    ];

    return GetBuilder<ReportController>(builder: (controller) {

        final data = controller.dashboardReportModel?.data?.charts?.applicationsByCategory ?? [];

        if (data.isEmpty) {
          return const Center(child: Text('No Data Found'));
        }

        final maxVal = data.map((e) => e.total!).reduce(math.max).toDouble();

        return LayoutBuilder(builder: (context, constraints) {

            return Row(crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(data.length, (i) {

                final item = data[i];
                final pct = item.total! / maxVal;

                return Expanded(
                  child: Padding(padding: EdgeInsets.only(right: i < data.length - 1 ? 6 : 0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [

                      Text(item.total.toString(),
                          style: textRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall)),

                      const SizedBox(height: 3),

                      Container(height: constraints.maxHeight * 0.45 * pct,
                          decoration: BoxDecoration(color: barColors[i % barColors.length],
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(4)))),

                        const SizedBox(height: 4),

                        RotatedBox(quarterTurns: 3, child: Text(item.name??'',
                            style: textRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall),
                            overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        );
      },
    );
  }
}