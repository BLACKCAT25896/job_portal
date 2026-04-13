import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/human_resource/award/controller/award_controller.dart';
import 'package:ecommerce/feature/human_resource/award/domain/models/award_model.dart';
import 'package:ecommerce/feature/human_resource/award/presentation/screens/create_new_award_screen.dart';
import 'package:ecommerce/feature/human_resource/award/presentation/widgets/award_item_widget.dart';

class AwardListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const AwardListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AwardController>(
      initState: (val) => Get.find<AwardController>().getAwardList(1),
      builder: (awardController) {
        final awardModel = awardController.awardModel;
        final awardData = awardModel?.data;

        return GenericListSection<AwardItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["award_list".tr],
          addNewTitle: "add_new_award".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "award".tr,
              child: const CreateNewAwardScreen())),
          headings: const ["name", "title", "description", "date", "amount", "award_type"],

          scrollController: scrollController,
          isLoading: awardModel == null,
          totalSize: awardData?.total ?? 0,
          offset: awardData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await awardController.getAwardList(offset ?? 1),

          items: awardData?.data ?? [],
          itemBuilder: (item, index) => AwardItemWidget(
            index: index,
            awardItem: item,
          ),
        );
      },
    );
  }
}