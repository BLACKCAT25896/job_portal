import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:mighty_job/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:mighty_job/feature/role_and_permission/user/presentation/widgets/user_list_for_filter.dart';

class SelectUserWidget extends StatefulWidget {
  final String userType;
  final String? title;
  const SelectUserWidget({super.key, this.userType = "", this.title});

  @override
  State<SelectUserWidget> createState() => _SelectUserWidgetState();
}

class _SelectUserWidgetState extends State<SelectUserWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final controller = Get.find<UserController>();
    if (controller.userModel == null) {
      controller.getUserList(1, userType: widget.userType);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(widget.title?? "user".tr,style: textRegular)),

        GetBuilder<UserController>(builder: (userController) {
            return DropdownSearch<UserItem>(
              selectedItem: userController.selectedUserItem,
              itemLabel: (item) => item.firstName ?? "",
              searchController: searchController,
              onSearch: (val) {
                userController.getUserList(1, search: val.trim(), userType: widget.userType);
              },
              listWidgetBuilder: () => UserListForPosWidget(userType: widget.userType),
            );
          },
        ),
      ],
    );
  }
}
