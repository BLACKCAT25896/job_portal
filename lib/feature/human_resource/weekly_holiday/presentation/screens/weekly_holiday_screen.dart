
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/presentation/screens/create_new_weekly_holiday_screen.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/presentation/widgets/weekly_holiday_list_widget.dart';

class WeeklyHolidayScreen extends StatefulWidget {
  const WeeklyHolidayScreen({super.key});

  @override
  State<WeeklyHolidayScreen> createState() => _WeeklyHolidayScreenState();
}

class _WeeklyHolidayScreenState extends State<WeeklyHolidayScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "weekly_holiday".tr),
      body: CustomWebScrollView(controller: scrollController, slivers: [
        SliverToBoxAdapter(child: WeeklyHolidayListWidget(scrollController: scrollController))
      ],),


      floatingActionButton: CustomFloatingButton(title: "add",
          onTap: ()=> Get.dialog(const CreateNewWeeklyHolidayScreen())));
  }
}



