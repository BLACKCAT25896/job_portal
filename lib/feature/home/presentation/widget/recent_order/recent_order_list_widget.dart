import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/home/presentation/widget/recent_order/recent_order_item_widget.dart';
import 'package:ecommerce/feature/order_management/order/presentation/widgets/create_new_order_widget.dart';
import 'package:ecommerce/feature/report_management/domain/model/dashboard_report_data_model.dart';
import 'package:ecommerce/feature/report_management/logic/report_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class RecentOrderListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const RecentOrderListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(builder: (controller) {
        final model = controller.dashboardReportModel;
        final data = model?.summary?.latestOrders;

        return GenericListSection<LatestOrders>(
          showRouteSection: false,
          topWidget: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Row(children: [
                Text("recent_order".tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
              ])),
          sectionTitle: "manage_order".tr,
          showActionOption: false,
          pathItems: ["order".tr],
          addNewTitle: "add_new_order".tr,
          onAddNewTap: () => showDialog(context: context, builder: (_) => Dialog(child: const CreateNewOrderWidget()),),
          headings: const ["order_id","customer","date","amount",],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize:  0,
          offset:  0,
          onPaginate: (offset) async {},

          items: data ?? [],
          itemBuilder: (item, index) => RecentOrderItemWidget(index: index, orderItem: item),
        );
      },
    );
  }
}

