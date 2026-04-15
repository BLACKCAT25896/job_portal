import 'dart:math';
import 'package:mighty_job/feature/report_management/logic/report_controller.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/feature/home/presentation/widget/filter_overview_widget.dart';
import 'package:mighty_job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class OrdersLineChart extends StatelessWidget {

  const OrdersLineChart({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ReportController>(builder: (reportController) {
      DashboardReportModel? reportModel = reportController.dashboardReportModel;

      List<OrderChart> data = reportModel?.orderChart ??[];
        List<FlSpot> spots = [];
        List<String> titles = [];
        spots = _generateSpots(data.map((e) => e.total).toList());
        titles = data.map((e) => e.label ?? "").toList();

        final double minY = 0;
        final double maxY = spots.map((e) => e.y).reduce(max);
        final double niceMaxY = _getNiceMaxValue(maxY);
        final double intervalY = (niceMaxY / 4).ceilToDouble();

        final int totalPoints = titles.length;
        final double intervalX = _calculateDynamicInterval(totalPoints);

        return Card(elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(child: Column(spacing: 4, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text("sales_overview".tr, style: textBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
                        Text("sales_overview_details".tr,
                          style: textRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall)),
                      ])),
                  SizedBox(width: 150, child: SelectSalesOverViewTypeWidget()),
                ]),
                const SizedBox(height: 16),

                SizedBox(height: 180,
                  child: LineChart(
                    LineChartData(minY: minY, maxY: niceMaxY,
                      gridData: FlGridData(show: true, drawVerticalLine: false),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40,
                            interval: intervalY,
                            getTitlesWidget: (value, _) => Text(_formatNumber(value), style: textRegular.copyWith(fontSize: 10),),
                          )),
                        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,
                          interval: ResponsiveHelper.isDesktop(context) ? intervalX : intervalX * 2,
                            getTitlesWidget: (value, _) {
                              int index = value.toInt();
                              if (index % intervalX.round() == 0 &&
                                  index >= 0 &&
                                  index < titles.length) {
                                return Padding(padding: const EdgeInsets.only(top: 4),
                                  child: Text(titles[index], style: textRegular.copyWith(fontSize: 10),
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      lineBarsData: [
                        LineChartBarData(spots: spots, isCurved: true,
                          gradient: LinearGradient(colors: [
                            systemPrimaryColor(),
                            Colors.deepOrangeAccent
                          ]),
                          barWidth: 3,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(show: true,
                            gradient: LinearGradient(colors: [
                                systemPrimaryColor().withValues(alpha: 0.3),
                                Colors.transparent
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          dotData: FlDotData(show: false),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipItems: (touchedSpots) {
                            return touchedSpots.map((spot) {
                              final index = spot.spotIndex;
                              if (index < 0 || index >= titles.length) {
                                return null;
                              }
                              return LineTooltipItem(
                                '${titles[index]}\n${_formatNumber(spot.y)} orders',
                                 textRegular.copyWith(),
                              );
                            }).toList();
                          },


                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  List<FlSpot> _generateSpots(List<dynamic> totals) {
    return totals.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), double.tryParse(e.value.toString()) ?? 0);
    }).toList();
  }



  double _calculateDynamicInterval(int totalPoints) {
    if (totalPoints <= 6) return 1;
    if (totalPoints <= 12) return 2;
    if (totalPoints <= 20) return 3;
    if (totalPoints <= 40) return 5;
    if (totalPoints <= 80) return 8;
    return (totalPoints / 10).ceilToDouble();
  }


  double _getNiceMaxValue(double maxValue) {
    if (maxValue <= 0) return 10;
    final magnitude = pow(10, (log(maxValue) / ln10).floor());
    final normalized = maxValue / magnitude;
    double rounded;
    if (normalized < 1.5) {
      rounded = 2;
    } else if (normalized < 3) {
      rounded = 3;
    } else if (normalized < 7) {
      rounded = 7;
    } else {
      rounded = 10;
    }
    return rounded * magnitude;
  }

  String _formatNumber(double value) {
    if (value >= 1000000) return '${(value / 1000000).toStringAsFixed(1)}M';
    if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}K';
    return value.toInt().toString();
  }
}
