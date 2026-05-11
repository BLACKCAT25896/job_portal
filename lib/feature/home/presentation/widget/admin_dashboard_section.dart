import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:job/feature/home/presentation/widget/category_wise_chart.dart';
import 'package:job/feature/home/presentation/widget/hiring_pipeline_widget.dart';
import 'package:job/feature/home/presentation/widget/recent_activity_widget.dart';
import 'package:job/feature/home/presentation/widget/recent_application_widget.dart';
import 'package:job/feature/home/presentation/widget/statistics_cards_widget.dart';
import 'package:job/feature/home/presentation/widget/vacancy_widget.dart';
import 'package:job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:job/feature/report_management/logic/report_controller.dart';
import 'package:job/util/dimensions.dart';

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
              CategoryWiseChart(),
              HiringPipelineWidget(),
              RecentApplicationWidget(),
              VacancyWidget(),
              RecentActivityWidget(),
              SizedBox(height: Dimensions.paddingSizeDefault),

            ],
          ):SizedBox();
        }
        ),
      ),
    ],
    );
  }
}
