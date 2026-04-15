import 'package:mighty_job/feature/home/presentation/widget/top_brand/top_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:mighty_job/feature/report_management/logic/report_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class TopBrandListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const TopBrandListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(builder: (controller) {
        final model = controller.dashboardReportModel;
        final data = model?.summary?.topBrands;

        return GenericListSection<TopProducts>(
          showRouteSection: false,
          topWidget: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Row(children: [
                Text("top_brand".tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
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
          itemBuilder: (item, index) => TopBrandItemWidget(index: index, productItem: item),
        );
      },
    );
  }
}

