import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:ecommerce/feature/role_and_permission/user/presentation/widgets/user_item_widget_for_filter.dart';

class UserListForPosWidget extends StatelessWidget {
  final String userType;
  const UserListForPosWidget({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      initState: (val) => Get.find<UserController>().getUserList(1, userType: userType),
      builder: (controller) {
        final model = controller.userModel;
        final data = model?.data?.data ?? [];

        return ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final user = data[index];
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(onTap: () {
                Get.back();
                controller.selectUser(user);
              },
                  child: UserItemWidgetForFilter(index: index, userItem: user)),
            );
          },
          separatorBuilder: (_, __) => const CustomDivider(),
        );
      },
    );
  }
}
