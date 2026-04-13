import 'package:ecommerce/feature/human_resource/weekly_holiday/presentation/widgets/select_day_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/controller/weekly_holiday_controller.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/domain/models/weekly_holiday_model.dart';
import 'package:ecommerce/util/dimensions.dart';

class CreateNewWeeklyHolidayScreen extends StatefulWidget {
  final WeeklyHolidayItem? weeklyHolidayItem;
  const CreateNewWeeklyHolidayScreen({super.key, this.weeklyHolidayItem});

  @override
  State<CreateNewWeeklyHolidayScreen> createState() => _CreateNewWeeklyHolidayScreenState();
}

class _CreateNewWeeklyHolidayScreenState extends State<CreateNewWeeklyHolidayScreen> {
  TextEditingController nameController = TextEditingController();
   bool update = false;
  @override
  void initState() {
    if(widget.weeklyHolidayItem != null){
      update = true;
      Get.find<WeeklyHolidayController>().selectDay(widget.weeklyHolidayItem?.day??'Friday', notify: false);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeeklyHolidayController>(builder: (weeklyHolidayController) {
        return Column(mainAxisSize: MainAxisSize.min, children: [

          SelectDayWidget(),

          weeklyHolidayController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

          Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String name = weeklyHolidayController.selectedDay;
                if(update){
                  weeklyHolidayController.updateWeeklyHoliday(name, int.parse(widget.weeklyHolidayItem!.id!));
                }else{
                  weeklyHolidayController.createNewWeeklyHoliday(name);
                }
            }, text: update? "update".tr : "save".tr))
        ],);
      }
    );
  }
}
