import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/app_bar_widget.dart';
import 'package:mighty_job/common/widget/body_widget.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/feature/home/presentation/widget/overview_chart_widget.dart';
import 'package:mighty_job/feature/home/presentation/widget/sales_report_ratio_chart.dart';
import 'package:mighty_job/feature/home/presentation/widget/statistics_cards_widget.dart';
import 'package:mighty_job/feature/profile/presentation/widgets/home_header_section_widget.dart';
import 'package:mighty_job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:mighty_job/feature/report_management/logic/report_controller.dart';
import 'package:mighty_job/util/dimensions.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Get.find<ReportController>().getDashboardReport();
    Get.find<SystemSettingsController>().getGeneralSetting();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: systemPrimaryColor(),
      body: BodyWidget(appBar : AppBarWidget(showBackButton: false,
          actionWidget: HomeHeaderSectionWidget()),
        body: RefreshIndicator(onRefresh: () async {
          Get.find<SystemSettingsController>().getImageSetting();
        },
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: GetBuilder<ReportController>(builder: (reportController) {
                DashboardReportModel? reportModel = reportController.dashboardReportModel;

                return reportModel != null?
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Dimensions.paddingSizeDefault, children: [


                    const StatisticsCardsWidget(),
                    Padding(padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeDefault),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: Dimensions.paddingSizeDefault, children: [
                              OrdersLineChart(),
                              const SalesReportRatioChartWidget()
                            ])),



                  ],
                ):SizedBox();
              }
              ),
            ),
          ],)
        ),
      ),


    );
  }
}
