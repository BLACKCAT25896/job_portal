import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/role_and_permission/role/controller/role_controller.dart';
import 'package:mighty_job/feature/role_and_permission/role/domain/models/role_model.dart';
import 'package:mighty_job/feature/role_and_permission/role/presentation/widgets/create_new_role_widget.dart';
import 'package:mighty_job/feature/role_and_permission/role/presentation/widgets/role_item.dart';

class RoleListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const RoleListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoleController>(
      initState: (val) => Get.find<RoleController>().getRoleList(1),
      builder: (roleController) {
        final roleModel = roleController.roleModel;
        final roleData = roleModel?.data;

        return GenericListSection<RoleItem>(
          sectionTitle: "roles_and_permissions".tr,
          pathItems: ["role_list".tr],
          addNewTitle: "add_new_roll".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(width: 700,
              title: "role".tr,
              child: CreateNewRoleWidget())),
          headings: const ["name"],

          scrollController: scrollController,
          isLoading: roleModel == null,
          totalSize: roleData?.total ?? 0,
          offset: roleData?.currentPage ?? 0,
          onPaginate: (offset) async => await roleController.getRoleList(offset ?? 1),

          items: roleData?.data ?? [],
          itemBuilder: (item, index) => RoleItemWidget(roleItem: item, index: index),
        );
      },
    );
  }
}
