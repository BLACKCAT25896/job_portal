import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_checkbox.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_item_text_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/sms/sent_sms/domain/model/user_list_for_sms_model.dart';
import 'package:mighty_job/feature/sms/sent_sms/logic/sent_sms_controller.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';

class SmsUserItemWidget extends StatelessWidget {
  final UserItemForSms? userItem;
  final int index;
  const SmsUserItemWidget({super.key, this.userItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeSmall, children: [
     NumberingWidget(index: index),
      Expanded(child: CustomItemTextWidget(text: userItem?.name??'')),
      Expanded(child: CustomItemTextWidget(text: userItem?.phone??'')),
      Expanded(child: CustomItemTextWidget(text: userItem?.userType??'')),
      CustomCheckbox(onChange: (){
        Get.find<SentSmsController>().toggleSelectedUser(index);
      }, value: userItem?.selected ?? false,),
    ]):

    Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, Dimensions.paddingSizeSmall, Dimensions.paddingSizeDefault, 0),
      child: CustomContainer(borderRadius: 5, 
        child: Row( children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomItemTextWidget(text: userItem?.name??''),
              CustomItemTextWidget(text: userItem?.phone??''),
              CustomItemTextWidget(text: userItem?.userType??''),
          ])),
          CustomCheckbox(onChange: (){}, value: userItem?.selected ?? false,),

        ])));
  }
  // Widget _buildPopupMenu(BuildContext context, UserItemForSms? userItem ) {
  //   return CustomPopupMenu(
  //     menuItems: Get.find<DashboardController>().getPopupMenuList(sendSms: true),
  //     onSelected: (option) {
  //       if (option.title == "send_sms".tr) {
  //        // Get.find<SentSmsController>().sentSms(userItem);
  //       }
  //     },
  //     child: Icon(Icons.more_vert, color: Theme.of(context).hintColor),
  //   );
  // }
}
