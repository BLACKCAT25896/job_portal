import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/domain/model/loyalty_point_model.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/logic/loyalty_point_controller.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/presentation/widgets/create_new_loyalty_point_widget.dart';
import 'package:mighty_job/feature/loyalty/loyalty_point/presentation/widgets/loyalty_point_item_widget.dart';

class LoyaltyPointListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const LoyaltyPointListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoyaltyPointController>(
      initState: (val) => Get.find<LoyaltyPointController>().getLoyaltyPoint(1),
      builder: (controller) {
        final model = controller.loyaltyPointModel;
        final data = model?.data;

        return GenericListSection<LoyaltyPointItem>(
          sectionTitle: "loyalty".tr,
          pathItems: ["loyalty_point".tr],
          addNewTitle: "add_new_loyalty_point".tr,
          onAddNewTap: () => showDialog(context: context, builder: (_) => Dialog(child: const CreateNewLoyaltyPointWidget()),),
          headings: const ["image", "name",'phone',"email", "address","company","contact_person",'status'],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getLoyaltyPoint(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => LoyaltyPointItemWidget(index: index, loyaltyPointItem: item),
        );
      },
    );
  }
}
