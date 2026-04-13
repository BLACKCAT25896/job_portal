import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/enum/action_type.dart';
import 'package:ecommerce/feature/inventory/damage/controller/damage_controller.dart';
import 'package:ecommerce/feature/inventory/damage/domain/models/damage_model.dart';
import 'package:ecommerce/feature/inventory/damage/presentation/widgets/damage_item.dart';
import 'package:ecommerce/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DamageListWidget extends StatelessWidget {
  final ScrollController scrollController;

  const DamageListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DamageController>(initState: (_) {
        Get.find<DamageController>().getDamageList(1);
      },
      builder: (controller) {
        final damageModel = controller.damageModel;
        final data = damageModel?.data?.data;

        return GenericListSection<DamageItem>(
          sectionTitle: "product_management".tr,
          pathItems: ["damage".tr],
          showActionOption: false,
          addNewTitle: "add_new_damage".tr,
          onAddNewTap: (){
            Get.toNamed(RouteHelper.getAddNewDamageRoute(ProductActionType.damage));
          },
          headings: const ["image","product", "reason", "quantity", "amount",  "date"],
          scrollController: scrollController,
          isLoading: damageModel == null,
          totalSize: damageModel?.data?.data?.total ?? 0,
          offset: damageModel?.data?.data?.currentPage ?? 0,
          onPaginate: (int? offset) async {
            await controller.getDamageList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return DamageItemWidget(damageItem: item, index: index);
          },
        );
      },
    );
  }
}
