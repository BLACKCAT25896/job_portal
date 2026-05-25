import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/feature/frontend/controller/frontend_controller.dart';
import 'package:job/feature/frontend/presentation/widgets/custom_range_slider_widget.dart';

class JobFilterWidget extends StatelessWidget {
  const JobFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(builder: (controller) {
      return CustomContainer(borderRadius: 5, showShadow: false,
        child: Column(children: [

          CustomRangeSlider(values: controller.salaryRange,
            title: "salary_range".tr, min: 0, max: 100,
            divisions: 10, onChanged: (values) {
            controller.updateSalaryRange(values);},
          ),


          CustomRangeSlider(values: controller.ageRange,
            title: "age_range".tr, min: 0, max: 100, divisions: 10,
            onChanged: (values) {
            controller.updateAgeRange(values);
            }),

          CustomRangeSlider(values: controller.experienceRange,
            title: "experience_range".tr, min: 0, max: 100, divisions: 10,
            onChanged: (values) {
            controller.updateExperienceRange(values);
            }),
        ]),
        );
      }
    );
  }
}
