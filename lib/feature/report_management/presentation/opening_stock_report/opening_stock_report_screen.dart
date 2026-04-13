
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/feature/report_management/presentation/opening_stock_report/opening_stock_report_list_widget.dart';

class OpeningStockReportScreen extends StatefulWidget {
  const OpeningStockReportScreen({super.key});

  @override
  State<OpeningStockReportScreen> createState() => _OpeningStockReportScreenState();
}

class _OpeningStockReportScreenState extends State<OpeningStockReportScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "opening_stock_report".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
          OpeningStockReportListWidget(scrollController: scrollController)

        ]))
      ]),
    );
  }
}
