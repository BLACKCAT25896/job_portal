import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';
import 'package:mighty_job/feature/human_resource/weekly_holiday/controller/weekly_holiday_controller.dart';

class SelectWeeklyHolidayWidget extends StatefulWidget {
  const SelectWeeklyHolidayWidget({super.key});

  @override
  State<SelectWeeklyHolidayWidget> createState() => _SelectWeeklyHolidayWidgetState();
}

class _SelectWeeklyHolidayWidgetState extends State<SelectWeeklyHolidayWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<WeeklyHolidayController>();
    if (controller.weeklyHolidayModel == null) {
      controller.getWeeklyHolidayList(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CustomTitle(title: "weekly_holiday"),
        GetBuilder<WeeklyHolidayController>(builder: (weeklyHolidayController) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomGenericDropdown(width: Get.width,
                title: "select_weekly_holiday".tr,
                items: weeklyHolidayController.weeklyHolidayModel?.data?.data ?? [],
                selectedValue: weeklyHolidayController.selectedWeeklyHolidayItem,
                getLabel: (item) => item.name ?? '',
                onChanged: (val) {
                  if (val != null) {
                    weeklyHolidayController.selectWeeklyHoliday(val);
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
