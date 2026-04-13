import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/domain/model/loyalty_point_redemption_model.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/logic/loyalty_point_redemption_controller.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/presentation/widgets/create_new_loyalty_point_redemption_widget.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/presentation/widgets/loyalty_point_redemption_item_widget.dart';

class LoyaltyPointRedemptionListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const LoyaltyPointRedemptionListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoyaltyPointRedemptionController>(
      initState: (val) => Get.find<LoyaltyPointRedemptionController>().getLoyaltyPointRedemption(1),
      builder: (controller) {
        final model = controller.loyaltyPointRedemptionModel;
        final data = model?.data;

        return GenericListSection<LoyaltyPointRedemptionItem>(
          sectionTitle: "loyalty".tr,
          pathItems: ["loyalty_point".tr],
          addNewTitle: "add_new_loyalty_point".tr,
          onAddNewTap: () => showDialog(context: context, builder: (_) => Dialog(child: const CreateNewLoyaltyPointRedemptionWidget()),),
          headings: const ["image", "name",'phone',"email", "address","company","contact_person",'status'],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getLoyaltyPointRedemption(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => LoyaltyPointRedemptionItemWidget(index: index, loyaltyPointRedemptionItem: item),
        );
      },
    );
  }
}
