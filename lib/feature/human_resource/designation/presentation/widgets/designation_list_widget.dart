import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/human_resource/designation/controller/designation_controller.dart';
import 'package:mighty_job/feature/human_resource/designation/domain/models/designation_model.dart';
import 'package:mighty_job/feature/human_resource/designation/presentation/screens/create_new_designation_screen.dart';
import 'package:mighty_job/feature/human_resource/designation/presentation/widgets/designation_item_widget.dart';

class DesignationListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const DesignationListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DesignationController>(
      initState: (val) => Get.find<DesignationController>().getDesignationList(1),
      builder: (designationController) {
        final designationModel = designationController.designationModel;
        final designationData = designationModel?.data;

        return GenericListSection<DesignationItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["designation_list".tr],
          addNewTitle: "add_new_designation".tr,
          onAddNewTap: () => Get.dialog(const CreateNewDesignationScreen()),
          headings: const ["name", "status",],

          scrollController: scrollController,
          isLoading: designationModel == null,
          totalSize: designationData?.total ?? 0,
          offset: designationData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await designationController.getDesignationList(offset ?? 1),

          items: designationData?.data ?? [],
          itemBuilder: (item, index) => DesignationItemWidget(
            index: index,
            designationItem: item,
          ),
        );
      },
    );
  }
}