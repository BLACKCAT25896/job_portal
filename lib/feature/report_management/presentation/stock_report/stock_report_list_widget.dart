import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/report_management/domain/model/stock_report_model.dart';
import 'package:mighty_job/feature/report_management/logic/report_controller.dart';
import 'package:mighty_job/feature/report_management/presentation/stock_report/stock_report_item_widget.dart';

class StockReportListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const StockReportListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      initState: (val) => Get.find<ReportController>().getStockReport(1),
      builder: (controller) {
        final model = controller.stockReportModel;
        final data = model?.data;

        return GenericListSection<StockReportItem>(
          sectionTitle: "reports".tr,
          pathItems: ["stock_report".tr],
          addNewTitle: "export_report".tr,
          onAddNewTap: () {},
          showActionOption: false,
          headings: const ["name", "quantity", "previous_qty", "new_qty", "unit_price", 'total_price'],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getStockReport(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => StockReportItemWidget(index: index, stockReportItem: item),
        );
      },
    );
  }
}
