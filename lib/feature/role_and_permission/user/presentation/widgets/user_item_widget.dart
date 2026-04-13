import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/role_and_permission/user/presentation/widgets/create_new_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_popup_menu.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce/feature/profile/domain/model/status_update_body.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:ecommerce/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';

class UserItemWidget extends StatelessWidget {
  final UserItem? userItem;
  final int index;
  const UserItemWidget({super.key, this.userItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
      NumberingWidget(index: index),
      CustomImage(width: 40, height: 40, image: "${AppConstants.imageBaseUrl}/users/${userItem?.avatar}",),
      Expanded(child: CustomTextItemWidget(text: '${userItem?.firstName} ${userItem?.lastName?? ''}')),
      Expanded(child: CustomTextItemWidget(text: userItem?.email?? 'N/A')),
      Expanded(child: CustomTextItemWidget(text: userItem?.phone?? 'N/A')),
      Expanded(child: CustomTextItemWidget(text: userItem?.userType?? 'N/A')),
      Expanded(child: CustomTextItemWidget(text: userItem?.address?? 'N/A')),

      ActiveInActiveWidget(active: userItem?.status == "1",
      onChanged: (val){
        StatusUpdateBody body = StatusUpdateBody(
          id: int.parse(userItem!.id!),
          type: "user",
          status: val ? "1" : "0",
        );
        Get.find<ProfileController>().globalStatusUpdate(body, onSuccess: () async {
          await Get.find<UserController>().getUserList(1);
        });
      }),
      CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
      onSelected: (value){
        if(value.title == "edit".tr){
          Get.dialog(CustomDialogWidget(title: "user".tr,
              child: CreateNewUserWidget(userItem: userItem)));
        }
        else if(value.title == "delete".tr){
          Get.dialog(ConfirmationDialog(title: "user",
            onTap: (){
              Get.back();
              Get.find<UserController>().deleteUser(int.parse(userItem!.id!));
            },));
        }
        }
      ),
    ],
    );
  }
}