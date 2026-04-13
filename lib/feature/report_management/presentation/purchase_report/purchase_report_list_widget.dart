import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/report_management/domain/model/purchase_report_model.dart';
import 'package:ecommerce/feature/report_management/logic/report_controller.dart';
import 'package:ecommerce/feature/report_management/presentation/purchase_report/purchase_report_item_widget.dart';
import 'package:ecommerce/feature/report_management/presentation/purchase_report/search_purchase_report_widget.dart';

class PurchaseReportListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const PurchaseReportListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      initState: (val) => Get.find<ReportController>().getPurchaseReport(1),
      builder: (controller) {
        final model = controller.purchaseReportModel;
        final data = model?.data;

        return GenericListSection<PurchaseReportItem>(
          topWidget: SearchPurchaseReportWidget(),
          sectionTitle: "reports".tr,
          pathItems: ["purchase_report".tr],
          addNewTitle: "export_report".tr,
          onAddNewTap: () {},
          showActionOption: false,
          headings: const ["purchase_date","invoice_no", "supplier_name",'total_amount'],
          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getPurchaseReport(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => PurchaseReportItemWidget(index: index, purchaseItem: item),
        );
      },
    );
  }
}
