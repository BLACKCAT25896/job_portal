import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/feature/home/presentation/widget/overview_chart_widget.dart';
import 'package:mighty_job/feature/home/presentation/widget/sales_report_ratio_chart.dart';
import 'package:mighty_job/feature/home/presentation/widget/statistics_cards_widget.dart';
import 'package:mighty_job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:mighty_job/feature/report_management/logic/report_controller.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';

class AdminDashboardSection extends StatelessWidget {
  final ScrollController scrollController;
  const AdminDashboardSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomWebScrollView(controller: scrollController, slivers: [
      SliverToBoxAdapter(
        child: GetBuilder<ReportController>(
          initState: (val){
            Get.find<ReportController>().getDashboardReport();
          },
            builder: (reportController) {
          DashboardReportModel? reportModel = reportController.dashboardReportModel;

          return reportModel != null?
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dimensions.paddingSizeDefault, children: [
              SizedBox(height: Dimensions.paddingSizeDefault),

              const StatisticsCardsWidget(),

              Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                  child: ResponsiveHelper.isDesktop(context)?
                  Row(crossAxisAlignment: CrossAxisAlignment.start,spacing: Dimensions.paddingSizeDefault, children: [
                    Expanded(child: OrdersLineChart(),),
                    SizedBox(width: 300, child: const SalesReportRatioChartWidget()),
                  ]): Column(crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: Dimensions.paddingSizeDefault, children: [
                        OrdersLineChart(),
                        const SalesReportRatioChartWidget(),
                      ])),

            ],
          ):SizedBox();
        }
        ),
      ),
    ],
    );
  }
}
