import 'package:ecommerce/feature/home/presentation/widget/top_category/top_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:ecommerce/feature/report_management/logic/report_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class TopCategoryListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const TopCategoryListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(builder: (controller) {
        final model = controller.dashboardReportModel;
        final data = model?.summary?.topCategories;

        return GenericListSection<TopProducts>(
          showRouteSection: false,
          topWidget: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Row(children: [
                Text("top_category".tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
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
          itemBuilder: (item, index) => TopCategoryItemWidget(index: index, productItem: item),
        );
      },
    );
  }
}

