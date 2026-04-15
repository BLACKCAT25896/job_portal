import 'package:mighty_job/feature/home/presentation/widget/top_product_order/top_product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:mighty_job/feature/report_management/logic/report_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class TopProductListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const TopProductListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(builder: (controller) {
        final model = controller.dashboardReportModel;
        final data = model?.summary?.topProducts;

        return GenericListSection<TopProducts>(
          showRouteSection: false,
          topWidget: Padding(padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault),
            child: Row(children: [
                Text("top_product".tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
              ])),
          sectionTitle: "manage_order".tr,
          showActionOption: false,
          headings: const ["name","total_sold",],
          scrollController: scrollController,
          isLoading: model == null,
          totalSize:  0,
          offset:  0,
          onPaginate: (offset) async {},

          items: data ?? [],
          itemBuilder: (item, index) => TopProductItemWidget(index: index, productItem: item),
        );
      },
    );
  }
}

