import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_rich_text_editor_widget/custom_richtext_editor_widget.dart';
import 'package:mighty_job/common/widget/custom_switch.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/date_selection_widget.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/frontend/presentation/widgets/job/select_public_job_category_widget.dart';
import 'package:mighty_job/feature/job_listing/presentation/widgets/post_a_job_section/select_employee_status.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class JobInformationWidget extends StatefulWidget {
  const JobInformationWidget({super.key});

  @override
  State<JobInformationWidget> createState() => _JobInformationWidgetState();
}

class _JobInformationWidgetState extends State<JobInformationWidget> {
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobLocationController = TextEditingController();
  TextEditingController vacancyController = TextEditingController();
  HtmlEditorController jobResponsibleAndContextController = HtmlEditorController();
  TextEditingController minimumSalaryController = TextEditingController();
  TextEditingController maximumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: Column(spacing: Dimensions.paddingSizeDefault,
        crossAxisAlignment: CrossAxisAlignment.start, children: [
      ResponsiveMasonryGrid(children: [
        CustomTextField(
          title: "job_title".tr,
          controller: jobTitleController,
          hintText: "enter_job_title".tr
        ),
        DateSelectionWidget(title: "deadline".tr),
        SelectPublicJobCategoryWidget(),

        CustomTextField(
          title: "job_location".tr,
          controller: jobLocationController,
            hintText: "enter_job_location".tr
        ),

        CustomTextField(
          title: "vacancy".tr,
          controller: vacancyController,
          hintText: "vacancy".tr
        ),


      ]),

      SelectionEmployeeWidget(),

      CustomRichEditor(
          title: "job_responsible_and_context".tr,
          controller: jobResponsibleAndContextController,
          hintText: "job_responsible_and_context".tr),

          Row(children: [
            Expanded(child: Text("monthly_salary".tr, style: Theme.of(context).textTheme.titleMedium,)),

            Row(children: [
              Text("show_salary".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              CustomSwitch(value: false, onChanged: (value) {}),
            ])]),

          ResponsiveMasonryGrid(children: [
            CustomTextField(
                title: "minimum_salary".tr,
                controller: minimumSalaryController,
                hintText: "minimum_salary".tr
            ),
            CustomTextField(
                title: "maximum_salary".tr,
                controller: maximumController,
                hintText: "maximum_salary".tr
            )
          ]),


    ]));
  }
}
