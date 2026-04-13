import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/feature/profile/domain/model/status_update_body.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_popup_menu.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/controller/weekly_holiday_controller.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/domain/models/weekly_holiday_model.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/presentation/screens/create_new_weekly_holiday_screen.dart';
import 'package:ecommerce/util/dimensions.dart';

class WeeklyHolidayItemWidget extends StatelessWidget {
  final WeeklyHolidayItem? weeklyHolidayItem;
  final int index;
  const WeeklyHolidayItemWidget({super.key, this.weeklyHolidayItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeSmall, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:'${weeklyHolidayItem?.day}')),
      ActiveInActiveWidget(active: weeklyHolidayItem?.status == "1", onChanged: (val){
        StatusUpdateBody body = StatusUpdateBody(id: int.parse(weeklyHolidayItem!.id!),
            status: val ? "1" : "0", type: "weekly-holiday");
        Get.find<ProfileController>().globalStatusUpdate(body, onSuccess: () async {
          await Get.find<WeeklyHolidayController>().getWeeklyHolidayList(1);
        });
      },),
      CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
      onSelected: (val){
        if(val.title == "edit".tr){
          Get.dialog(CustomDialogWidget(title: "weekly_holiday".tr,
              child: CreateNewWeeklyHolidayScreen(weeklyHolidayItem: weeklyHolidayItem)));
        }else{
          Get.dialog(ConfirmationDialog(title: "weekly_holiday", content: "weekly_holiday",
            onTap: (){
              Get.back();
              Get.find<WeeklyHolidayController>().deleteWeeklyHoliday(int.parse(weeklyHolidayItem!.id!));
            },));
        }
      },),
    ],
    );
  }
}