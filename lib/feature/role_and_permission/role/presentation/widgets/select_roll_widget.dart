
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/role_and_permission/role/controller/role_controller.dart';
import 'package:ecommerce/feature/role_and_permission/role/domain/models/role_model.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/common/widget/custom_generic_dropdown.dart';

class SelectRoleWidget extends StatefulWidget {
  final bool fromUser;
  const SelectRoleWidget({super.key, this.fromUser = false});

  @override
  State<SelectRoleWidget> createState() => _SelectRoleWidgetState();
}

class _SelectRoleWidgetState extends State<SelectRoleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if(!widget.fromUser)
      SizedBox(height: Dimensions.paddingSizeDefault),
      if(!widget.fromUser)
      CustomTitle(title: "roll", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<RoleController>(
        initState: (_) {
          if (Get.find<RoleController>().roleModel == null) {
            Get.find<RoleController>().getRoleList(1);
          }
        },
        builder: (roleController) {
          RoleModel? roleModel = roleController.roleModel;

          return (roleModel != null && roleModel.data?.data != null && roleModel.data!.data!.isNotEmpty )?
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomGenericDropdown<RoleItem>(
              title : "select_roll".tr,
              items: roleModel.data?.data??[],
              onChanged: (item) => roleController.setRoleItem(item!, fromUser: widget.fromUser),
              selectedValue: roleController.selectedRoleItem,
              getLabel: (item) => item.name??'',
            ),

          ):SizedBox();
        },
      ),
    ],
    );
  }
}
