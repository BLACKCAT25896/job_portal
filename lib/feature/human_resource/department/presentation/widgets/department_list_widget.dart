import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/human_resource/department/controller/department_controller.dart';
import 'package:ecommerce/feature/human_resource/department/domain/models/department_model.dart';
import 'package:ecommerce/feature/human_resource/department/presentation/screens/create_new_department_screen.dart';
import 'package:ecommerce/feature/human_resource/department/presentation/widgets/department_item_widget.dart';

class DepartmentListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const DepartmentListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepartmentController>(
      initState: (val) => Get.find<DepartmentController>().getDepartmentList(1),
      builder: (departmentController) {
        final departmentModel = departmentController.departmentModel;
        final departmentData = departmentModel?.data;

        return GenericListSection<DepartmentItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["department".tr],
          addNewTitle: "add_new_department".tr,
          onAddNewTap: () => Get.dialog(const CreateNewDepartmentScreen()),
          headings: const ["name", "status",],

          scrollController: scrollController,
          isLoading: departmentModel == null,
          totalSize: departmentData?.total ?? 0,
          offset: departmentData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await departmentController.getDepartmentList(offset ?? 1),

          items: departmentData?.data ?? [],
          itemBuilder: (item, index) => DepartmentItemWidget(
            index: index,
            departmentItem: item,
          ),
        );
      },
    );
  }
}