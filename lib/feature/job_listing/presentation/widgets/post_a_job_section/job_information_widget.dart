import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_rich_text_editor_widget/custom_rich_editor_v2.dart';
import 'package:job/common/widget/custom_switch.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/common/widget/date_selection_widget.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/frontend/presentation/widgets/job/select_public_job_category_widget.dart';
import 'package:job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:job/feature/job_listing/presentation/widgets/post_a_job_section/select_employee_status.dart';
import 'package:job/feature/job_listing/presentation/widgets/post_a_job_section/select_festival_bonus_widget.dart';
import 'package:job/feature/job_listing/presentation/widgets/post_a_job_section/select_lunch_facility_widget.dart';
import 'package:job/feature/job_listing/presentation/widgets/post_a_job_section/select_salary_review_widget.dart';
import 'package:job/feature/job_listing/presentation/widgets/post_a_job_section/selection_benefit_widget.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class JobInformationWidget extends StatefulWidget {
  const JobInformationWidget({super.key});

  @override
  State<JobInformationWidget> createState() => _JobInformationWidgetState();
}

class _JobInformationWidgetState extends State<JobInformationWidget> {
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobLocationController = TextEditingController();
  TextEditingController vacancyController = TextEditingController();
  QuillController jobResponsibleAndContextController = QuillController.basic();
  QuillController otherBenefitController = QuillController.basic();
  TextEditingController minimumSalaryController = TextEditingController();
  TextEditingController maximumController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobListingController>(builder: (controller) {
        return CustomContainer(child: Column(spacing: Dimensions.paddingSizeDefault,
            crossAxisAlignment: CrossAxisAlignment.start, children: [
          ResponsiveMasonryGrid(children: [
            CustomTextField(
              title: "job_title".tr,
              controller: jobTitleController,
              hintText: "job_title".tr
            ),
            DateSelectionWidget(title: "deadline".tr),
            SelectPublicJobCategoryWidget(),

            CustomTextField(
              title: "job_location".tr,
              controller: jobLocationController,
                hintText: "job_location".tr
            ),

            CustomTextField(
              title: "vacancy".tr,
              controller: vacancyController,
              inputType: TextInputType.number,
              inputFormatters: [AppConstants.numberFormat],
              hintText: "vacancy".tr
            ),


          ]),

          SelectionEmployeeWidget(),

          CustomRichEditorV2(
              title: "job_responsible_and_context".tr,
              controller: jobResponsibleAndContextController,
              hintText: "job_responsible_and_context".tr),

              Row(children: [
                Expanded(child: Text("monthly_salary".tr, style: Theme.of(context).textTheme.titleMedium,)),

                Row(children: [
                  Text("show_salary".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
                  SizedBox(width: Dimensions.paddingSizeSmall),
                  CustomSwitch(value: controller.hideSalary, onChanged: (value) {
                    controller.toggleHideSalary();
                  }),
                ])]),

              ResponsiveMasonryGrid(children: [
                CustomTextField(
                  inputFormatters: [AppConstants.numberFormat],
                    inputType: TextInputType.number,
                    title: "minimum_salary".tr,
                    controller: minimumSalaryController,
                    hintText: "minimum_salary".tr
                ),
                CustomTextField(
                    inputFormatters: [AppConstants.numberFormat],
                    inputType: TextInputType.number,
                    title: "maximum_salary".tr,
                    controller: maximumController,
                    hintText: "maximum_salary".tr
                )
              ]),


              CustomAddNewButtonWidget(icon: Icons.add, onTap: () {

                Get.dialog(CustomDialogWidget(width: 700, title: "compensations_and_benefits".tr,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: Dimensions.paddingSizeDefault,
                        children: [
                      SelectionBenefitWidget(),
                      ResponsiveMasonryGrid(width: 400, children: [
                        SelectionLunchWidget(),
                        SelectionSalaryWidget(),
                      ]),
                      SelectionFestivalBonusWidget(),

                      CustomRichEditorV2(
                        height: 200,
                          title: "other_benefits".tr,
                          controller: otherBenefitController,
                          hintText: "other_benefits".tr),

                      Align(alignment: Alignment.centerRight,
                        child: SizedBox(width: 150,
                          child: CustomButton(onTap: (){

                          }, text: "save".tr),
                        ),
                      )


                  ])));
                  },
                  title: "add_compensations_and_benefits_information".tr),

              CustomContainer(showShadow: false, borderRadius: 5,
                verticalPadding: 20,
                color: systemPrimaryColor().withValues(alpha: .125),
                child: Align(alignment: Alignment.centerRight,
                  child: SizedBox(width: 150,
                child: CustomButton(onTap: (){
                  Get.find<JobListingController>().selectStep(1);
                }, text: "continue".tr),
              )),)


        ]));
      }
    );
  }
}
