import 'package:mighty_job/feature/home/presentation/widget/ouder_status_wise_count_card_item_widget.dart';
import 'package:mighty_job/feature/report_management/logic/report_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class OrderStatusWiseCount extends StatelessWidget {
  const OrderStatusWiseCount({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ReportController>(builder: (reportController) {
      final model = reportController.dashboardReportModel;
      final items = model?.orderStatusCounts??[];

      return MasonryGridView.builder(shrinkWrap: true,
          mainAxisSpacing: Dimensions.paddingSizeDefault,
          crossAxisSpacing: Dimensions.paddingSizeDefault,
          itemCount: items.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400),
            itemBuilder: (_, index){
              final status = items[index];
              return OrderStatusWiseCountCardWidget(icon: Images.order,
                title: status.name??'', count: status.total ?? 0);
            });

      },
    );
  }
}
