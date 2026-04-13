import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/report_management/domain/model/opening_stock_report_model.dart';
import 'package:ecommerce/feature/report_management/logic/report_controller.dart';
import 'package:ecommerce/feature/report_management/presentation/opening_stock_report/opening_stock_report_item_widget.dart';
import 'package:ecommerce/feature/report_management/presentation/purchase_report/search_purchase_report_widget.dart';

class OpeningStockReportListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const OpeningStockReportListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      initState: (val) => Get.find<ReportController>().getStockOpeningReport(),
      builder: (controller) {
        final model = controller.openingStockReportModel;
        final data = model?.data;

        return GenericListSection<OpeningStockReportItem>(
          topWidget: SearchPurchaseReportWidget(type: "opening_stock",),
          sectionTitle: "reports".tr,
          pathItems: ["opening_stock_report".tr],
          addNewTitle: "export_report".tr,
          onAddNewTap: () {},
          showActionOption: false,
          headings: const ["name", "opening_stock", "current_stock", 'unit_cost','market_value'],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize:  0,
          offset:  0,
          onPaginate: (offset) async => await controller.getStockOpeningReport(),

          items: data?.data ?? [],
          itemBuilder: (item, index) => OpeningStockReportItemWidget(index: index, stockReportItem: item),
        );
      },
    );
  }
}
