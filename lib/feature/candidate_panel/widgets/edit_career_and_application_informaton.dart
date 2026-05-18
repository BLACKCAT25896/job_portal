import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/job_listing/controller/job_listing_controller.dart';
import 'package:job/feature/job_listing/presentation/widgets/post_a_job_section/select_employee_status.dart';
import 'package:job/feature/job_listing/presentation/widgets/post_a_job_section/select_job_level.dart';
import 'package:job/feature/profile/domain/model/profile_model.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';

class EditCareenAndApplicationWidget extends StatefulWidget {
  const EditCareenAndApplicationWidget({super.key});

  @override
  State<EditCareenAndApplicationWidget> createState() => _EditCareenAndApplicationWidgetState();
}

class _EditCareenAndApplicationWidgetState extends State<EditCareenAndApplicationWidget> {

  TextEditingController objectiveController = TextEditingController();
  TextEditingController presentSalaryController = TextEditingController();
  TextEditingController expectedSalaryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final controller = Get.find<ProfileController>();
    final data = controller.profileModel?.data;
    final candidate = data?.candidateInfo;
    if(candidate == null) return;

    objectiveController.text = candidate.careerObject??"";
    presentSalaryController.text = candidate.currentSalary??"";
    expectedSalaryController.text = candidate.expectedSalary??"";
    Get.find<JobListingController>().selectJobLevel(candidate.lookingFor??"", notify: false);
    Get.find<JobListingController>().selectEmployeeStatus(candidate.availableFor??"", notify: false);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      final data = profileController.profileModel?.data;
      final candidate = data?.candidateInfo;
      if(candidate == null) return Container();

      return Column(crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimensions.paddingSizeDefault, children: [
            CustomTextField(
              minLines: 3,
              maxLines: 5,
              inputType: TextInputType.multiline,
              inputAction: TextInputAction.newline,
              hintText: "objective".tr,
              title: "objective".tr,
              controller: objectiveController,
            ),
            ResponsiveMasonryGrid(children: [
              CustomTextField(
                isAmount: true,
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
                hintText: "present_salary".tr,
                title: "present_salary".tr,
                controller: presentSalaryController,
              ),
              CustomTextField(
                isAmount: true,
                inputFormatters: [AppConstants.numberFormat],
                inputType: TextInputType.number,
                hintText: "expected_salary".tr,
                title: "expected_salary".tr,
                controller: expectedSalaryController,
              ),
            ]),


          SelectionJobLevelWidget(),

          SelectionEmployeeWidget(),





          CustomButton(onTap: (){
            String objective = objectiveController.text;
            String presentSalary = presentSalaryController.text;
            String expectedSalary = expectedSalaryController.text;
            String lookingFor = Get.find<JobListingController>().selectedJobLevel;
            String availableFor = Get.find<JobListingController>().selectedEmployeeStatus;
            profileController.updateCandidateProfile(CandidateInfo(
              careerObject: objective,
              currentSalary: presentSalary,
              expectedSalary: expectedSalary,
              lookingFor: lookingFor,
              availableFor: availableFor,
            ));
            }, text: "save".tr)
          ],
        );
    }
    );
  }
}
