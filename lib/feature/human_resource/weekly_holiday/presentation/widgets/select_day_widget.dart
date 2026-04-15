import 'package:mighty_job/feature/human_resource/weekly_holiday/controller/weekly_holiday_controller.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_generic_dropdown.dart';

class SelectDayWidget extends StatefulWidget {
  const SelectDayWidget({super.key});

  @override
  State<SelectDayWidget> createState() => _SelectDayWidgetState();
}

class _SelectDayWidgetState extends State<SelectDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      Padding(padding: const EdgeInsets.only(top: 8.0),
          child: Text("status".tr, style: textRegular)),
      GetBuilder<WeeklyHolidayController>(builder: (controller) {
        return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomGenericDropdown(width: Get.width,
            title: "select_status".tr,
            items: controller.days,
            selectedValue: controller.selectedDay,
            getLabel: (item) => item,
            onChanged: (val) {
              if (val != null) {
                controller.selectDay(val);
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
