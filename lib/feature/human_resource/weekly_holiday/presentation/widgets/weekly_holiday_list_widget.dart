import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/controller/weekly_holiday_controller.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/domain/models/weekly_holiday_model.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/presentation/screens/create_new_weekly_holiday_screen.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/presentation/widgets/weekly_holiday_item_widget.dart';

class WeeklyHolidayListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const WeeklyHolidayListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeeklyHolidayController>(
      initState: (val) => Get.find<WeeklyHolidayController>().getWeeklyHolidayList(1),
      builder: (weeklyHolidayController) {
        final weeklyHolidayModel = weeklyHolidayController.weeklyHolidayModel;
        final weeklyHolidayData = weeklyHolidayModel?.data;

        return GenericListSection<WeeklyHolidayItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["weekly_holiday_list".tr],
          addNewTitle: "add_new_weekly_holiday".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "weekly_holiday".tr,
              child: const CreateNewWeeklyHolidayScreen())),
          headings: const ["name"],

          scrollController: scrollController,
          isLoading: weeklyHolidayModel == null,
          totalSize: weeklyHolidayData?.total ?? 0,
          offset: weeklyHolidayData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await weeklyHolidayController.getWeeklyHolidayList(offset ?? 1),

          items: weeklyHolidayData?.data ?? [],
          itemBuilder: (item, index) => WeeklyHolidayItemWidget(
            index: index,
            weeklyHolidayItem: item,
          ),
        );
      },
    );
  }
}