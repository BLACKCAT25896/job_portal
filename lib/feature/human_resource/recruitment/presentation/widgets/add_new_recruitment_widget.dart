import 'package:mighty_job/common/controller/date_picker_controller.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/human_resource/department/controller/department_controller.dart';
import 'package:mighty_job/feature/human_resource/department/domain/models/department_model.dart';
import 'package:mighty_job/feature/human_resource/designation/controller/designation_controller.dart';
import 'package:mighty_job/feature/human_resource/designation/domain/models/designation_model.dart';
import 'package:mighty_job/feature/human_resource/recruitment/controller/recruitment_controller.dart';
import 'package:mighty_job/feature/human_resource/recruitment/domain/models/recruitment_body.dart';
import 'package:mighty_job/feature/human_resource/recruitment/presentation/widgets/select_job_type_widget.dart';
import 'package:mighty_job/feature/role_and_permission/user/controller/user_controller.dart';
import 'package:mighty_job/feature/role_and_permission/user/domain/models/user_model.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/date_selection_widget.dart';
import 'package:mighty_job/feature/human_resource/department/presentation/widgets/department_selection_widget.dart';
import 'package:mighty_job/feature/human_resource/designation/presentation/widgets/designation_selection_widget.dart';
import 'package:mighty_job/feature/human_resource/recruitment/domain/models/recruitment_model.dart';
import 'package:mighty_job/feature/role_and_permission/user/presentation/widgets/user_selection_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class AddNewRecruitmentWidget extends StatefulWidget {
  final RecruitmentItem? recruitmentItem;
  const AddNewRecruitmentWidget({super.key, this.recruitmentItem});

  @override
  State<AddNewRecruitmentWidget> createState() => _AddNewRecruitmentWidgetState();
}

class _AddNewRecruitmentWidgetState extends State<AddNewRecruitmentWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController vacancyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController requirementsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.recruitmentItem != null){
      titleController.text = widget.recruitmentItem?.title??'';
      vacancyController.text = widget.recruitmentItem?.vacancyCount.toString()??"0";
      descriptionController.text = widget.recruitmentItem?.description??'';
      requirementsController.text = widget.recruitmentItem?.requirements??'';
      Get.find<RecruitmentController>().selectJobType(widget.recruitmentItem?.jobType??'', notify: false);
      Get.find<DepartmentController>().selectDepartment(DepartmentItem(
        id: widget.recruitmentItem?.departmentId.toString(),
        name: widget.recruitmentItem?.departmentName), notify: false);
      Get.find<DesignationController>().selectDesignation(DesignationItem(
          id: widget.recruitmentItem?.designationId.toString(),
          title: widget.recruitmentItem?.designationTitle), notify: false);

      Get.find<UserController>().selectUser(UserItem(
          id: widget.recruitmentItem?.recruiterId.toString(),
          firstName: widget.recruitmentItem?.recruiterFirstName,
        lastName: widget.recruitmentItem?.recruiterLastName
      ), notify: false);

      Get.find<DatePickerController>().setDateFromString(widget.recruitmentItem?.startDate??"${DateTime.now()}");
      Get.find<DatePickerController>().setEndDateFromString(widget.recruitmentItem?.endDate??"${DateTime.now()}");

    }
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecruitmentController>(builder: (controller) {
        return Column(spacing: Dimensions.paddingSizeSmall, children: [

          Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: CustomContainer(showShadow: false, borderRadius: 5,
              child: Column(
                children: [
                  ResponsiveMasonryGrid(width : 300,children: [
                    CustomTextField(controller: titleController,
                      hintText: "title".tr,
                      title: "title".tr,),

                    CustomTextField(title: "vacancy".tr,
                        hintText: "vacancy".tr,
                        inputType: TextInputType.number,
                        inputFormatters: [AppConstants.numberFormat],
                        controller: vacancyController),


                    SelectDepartmentWidget(),
                    SelectDesignationWidget(),
                    SelectUserWidget(userType: "manager", title: "recruiter".tr),

                    DateSelectionWidget(title: "start_date".tr, ),
                    ExpiryDateSelectionWidget(title: "expiry_date".tr),
                    SelectJobTypeWidget()

                  ]),
                  CustomTextField(
                    controller: descriptionController,
                    hintText: "description".tr,
                    title: "description".tr,
                    maxLines: 15,
                    minLines: 3,
                    inputType: TextInputType.multiline,
                    inputAction: TextInputAction.newline,
                  ),

                  CustomTextField(
                    controller: requirementsController,
                    hintText: "requirements".tr,
                    title: "requirements".tr,
                    maxLines: 15,
                    minLines: 3,
                    inputType: TextInputType.multiline,
                    inputAction: TextInputAction.newline,
                  ),
                ],
              ),
            ),
          ),


          controller.isLoading? Center(child: CircularProgressIndicator()):
          Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String title = titleController.text.trim();
              String vacancy = vacancyController.text.trim();
              String description = descriptionController.text.trim();
              String requirements = requirementsController.text.trim();
              String? userId = Get.find<UserController>().selectedUserItem?.id;
              String jobType = controller.selectedJobType;
              String? departmentId = Get.find<DepartmentController>().selectedDepartmentItem?.id;
              String? designationId = Get.find<DesignationController>().selectedDesignationItem?.id;
              String? startDate = Get.find<DatePickerController>().formatedFromDate;
              String? endDate = Get.find<DatePickerController>().formatedToDate;

              if(title.isEmpty){
                showCustomSnackBar("title_is_empty".tr);
              }else if(vacancy.isEmpty){
                showCustomSnackBar("vacancy_is_empty".tr);
              }else if(description.isEmpty){
                showCustomSnackBar("description_is_empty".tr);
              }else if(requirements.isEmpty){
                showCustomSnackBar("requirements_is_empty".tr);
              }else if(userId == null){
                showCustomSnackBar("select_recruiter".tr);
              }else if(departmentId == null){
                showCustomSnackBar("select_department".tr);
              }else if(designationId == null){
                showCustomSnackBar("select_designation".tr);
              }else{
                RecruitmentBody body = RecruitmentBody(
                  title: title,
                  vacancyCount: vacancy,
                  description: description,
                  requirements: requirements,
                  recruiterId: userId,
                  jobType: jobType,
                  departmentId: departmentId,
                  designationId: designationId,
                  status: "open",
                  startDate: startDate,
                  endDate: endDate,
                  method: widget.recruitmentItem == null ? "post" : "put",
                );
                if(widget.recruitmentItem != null){
                  controller.updateRecruitment(body, widget.recruitmentItem!.id!);
                }else {
                  controller.createNewRecruitment(body);
                }
              }
            }, text: "confirm".tr),
          )
        ]);
      }
    );
  }
}
