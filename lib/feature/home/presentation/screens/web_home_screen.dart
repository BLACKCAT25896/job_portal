import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/home/presentation/widget/top_brand/top_brand_list.dart';
import 'package:mighty_job/feature/home/presentation/widget/top_category/top_category_list.dart';
import 'package:mighty_job/feature/home/presentation/widget/top_product_order/top_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/cms_management/cms_settings/controller/system_settngs_controller.dart';
import 'package:mighty_job/feature/home/presentation/widget/overview_chart_widget.dart';
import 'package:mighty_job/feature/home/presentation/widget/sales_report_ratio_chart.dart';
import 'package:mighty_job/feature/home/presentation/widget/statistics_cards_widget.dart';
import 'package:mighty_job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:mighty_job/feature/report_management/logic/report_controller.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';


class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({super.key});

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Get.find<ReportController>().getDashboardReport();
    Get.find<SystemSettingsController>().getGeneralSetting();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "dashboard".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(
            child: GetBuilder<ReportController>(builder: (reportController) {
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


                    ResponsiveMasonryGrid(crossAxisSpacing: 0,
                        width: 600, children: [
                      TopProductListWidget(scrollController: scrollController),
                      TopCategoryListWidget(scrollController: scrollController),
                      TopBrandListWidget(scrollController: scrollController),
                    ]),

                  ],
                ):SizedBox();
              }
            ),
          ),
        ],
      ),
    );
  }
}
