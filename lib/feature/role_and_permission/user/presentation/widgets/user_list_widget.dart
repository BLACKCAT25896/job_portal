import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/role_and_permission/user/presentation/widgets/create_new_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/role_and_permission/role/presentation/widgets/select_roll_widget.dart';
import 'package:ecommerce/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:ecommerce/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:ecommerce/feature/role_and_permission/user/presentation/widgets/user_item_widget.dart';

class UserListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const UserListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      initState: (val) => Get.find<UserController>().getUserList(1),
      builder: (userController) {
        final userModel = userController.userModel;
        final userData = userModel?.data;
        return GenericListSection<UserItem>(
          subWidget: SizedBox(width: 200, child: SelectRoleWidget(fromUser: true)),
          sectionTitle: "user".tr,
          pathItems: ["user_list".tr],
          addNewTitle: "add_new_user".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "user".tr,
              child: const CreateNewUserWidget())),
          headings: const ["image", "name","email","phone", "user_type", "address",  "status",],
          scrollController: scrollController,
          isLoading: userModel == null,
          totalSize: userData?.total ?? 0,
          offset: userData?.currentPage ?? 0,
          onPaginate: (offset) async => await userController.getUserList(offset ?? 1),
          items: userData?.data ?? [],
          itemBuilder: (item, index) => UserItemWidget(index: index, userItem: item),
        );
      },
    );
  }
}