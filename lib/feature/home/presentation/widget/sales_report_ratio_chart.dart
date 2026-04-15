import 'package:mighty_job/feature/report_management/logic/report_controller.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class SalesReportRatioChartWidget extends StatefulWidget {
  const SalesReportRatioChartWidget({super.key});

  @override
  State<SalesReportRatioChartWidget> createState() => _SalesReportRatioChartWidgetState();
}

class _SalesReportRatioChartWidgetState extends State<SalesReportRatioChartWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(builder: (controller) {
      final model = controller.dashboardReportModel;
      final earning = model?.earnings;
      final total = (earning?.totalSales??0) + (earning?.completedSales??0) + (earning?.totalDue??0)+(earning?.totalPaid??0);
        return CustomContainer(showShadow: false,
          child: Column(mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dimensions.paddingSizeSmall, children: [

            Text("earning_report".tr, style: textMedium.copyWith(
                fontSize: Dimensions.fontSizeDefault)),


            Center(
              child: Stack(alignment: Alignment.center, children: [
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: (earning?.totalSales ?? 0) / total,
                  startAngle: 180,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: systemPrimaryColor(),
                ),

                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 13.0,
                  animation: true,  startAngle: 180,
                  percent: (earning?.totalPaid ?? 0) / total,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Theme.of(context).secondaryHeaderColor,
                ),
                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 13.0,
                  animation: true,
                  startAngle: 180,
                  percent: (earning?.totalDue ?? 0) / total,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Theme.of(context).colorScheme.error,
                ),
                CircularPercentIndicator(
                  radius: 20.0,
                  lineWidth: 13.0,
                  animation: true,  startAngle: 180,
                  percent: (earning?.completedSales ?? 0) / total,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.blue,
                ),
              ],
              ),
            ),
            const SizedBox(height: 16),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, spacing: 20,
              children: [
                _buildLegend("total_sales".tr, "${earning?.totalSales??0}",
                    systemPrimaryColor()),
                _buildLegend("total_paid".tr, "${earning?.totalPaid??0}",
                    Theme.of(context).secondaryHeaderColor),

              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, spacing: 20,
              children: [

                _buildLegend("total_due".tr, "${earning?.totalDue??0}",
                    Theme.of(context).colorScheme.error),
                _buildLegend("completed_sales".tr, "${earning?.completedSales??0}",
                  Colors.blue),
              ],
            ),
          ],
          ),
        );
      }
    );
  }

  Widget _buildLegend(String label, String value, Color color) {
    return Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
        CircleAvatar(radius: 4, backgroundColor: color),
        Text(label, style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
            color: Colors.grey)),
        Text(value, style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
      ],
    );
  }
}

