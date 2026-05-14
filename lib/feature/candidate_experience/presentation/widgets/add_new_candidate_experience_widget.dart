import 'package:job/common/controller/date_picker_controller.dart';
import 'package:job/common/widget/custom_checkbox.dart';
import 'package:job/common/widget/date_selection_widget.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_experience/controller/candidate_experience_controller.dart';
import 'package:job/feature/candidate_experience/domain/models/candidate_experience_body.dart';
import 'package:job/feature/candidate_experience/domain/models/candidate_experience_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/util/dimensions.dart';

class AddNewCandidateExperienceWidget extends StatefulWidget {
  final CandidateExperienceItem? candidateExperienceItem;
  const AddNewCandidateExperienceWidget({super.key, this.candidateExperienceItem});

  @override
  State<AddNewCandidateExperienceWidget> createState() => _AddNewCandidateExperienceWidgetState();
}

class _AddNewCandidateExperienceWidgetState extends State<AddNewCandidateExperienceWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController companyBusinessController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController expertiseAreasController = TextEditingController();
  TextEditingController responsibilitiesController = TextEditingController();


  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.candidateExperienceItem != null) {
      update = true;

    }
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CandidateExperienceController>(builder: (candidateExperienceController) {
      return Column(mainAxisSize: MainAxisSize.min, children: [

        ResponsiveMasonryGrid(width: 300, children: [

          CustomTextField(title: "title".tr,
            controller: titleController,
            hintText: "title".tr,),

          CustomTextField(title: "company".tr,
            controller: companyController,
            hintText: "company".tr,),

          CustomTextField(title: "company_business".tr,
            controller: companyBusinessController,
            hintText: "company_business".tr,),

          CustomTextField(title: "designation".tr,
            controller: designationController,
            hintText: "designation".tr,),

          CustomTextField(title: "department".tr,
            controller: departmentController,
            hintText: "department".tr,),


          DateSelectionWidget(title: "start_date".tr,),
          ExpiryDateSelectionWidget(title: "end_date".tr),

          CustomCheckbox(title: "currently_working".tr,
            value: candidateExperienceController.isCurrentlyWorking,
            onChange: ()=> candidateExperienceController.toggleCurrentlyWorking(),),


        ]),

            CustomTextField(
              title: "expertise_areas".tr,
              controller: expertiseAreasController,
              hintText: "expertise_areas".tr,
              maxLines: 5, minLines: 3,
              inputType: TextInputType.multiline,
              inputAction: TextInputAction.newline,
            ),

            CustomTextField(
              title: "responsibilities".tr,
              controller: descriptionController,
              hintText: "responsibilities".tr,
              maxLines: 5, minLines: 3,
              inputType: TextInputType.multiline,
              inputAction: TextInputAction.newline,
            ),




            candidateExperienceController.isLoading? Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){
                  String title = titleController.text.trim();
                  bool isCurrentlyWorking = candidateExperienceController.isCurrentlyWorking;
                  String company = companyController.text.trim();
                  String description = descriptionController.text.trim();
                  String companyBusiness = companyBusinessController.text.trim();
                  String designation = designationController.text.trim();
                  String department = departmentController.text.trim();
                  String expertiseAreas = expertiseAreasController.text.trim();
                  String startDate = Get.find<DatePickerController>().formatedFromDate;
                  String endDate = Get.find<DatePickerController>().formatedToDate;


                  if(title.isEmpty){
                    showCustomSnackBar("title_is_empty".tr);
                  }else if(company.isEmpty){
                    showCustomSnackBar("company_is_empty".tr);
                  }else if(description.isEmpty){
                    showCustomSnackBar("description_is_empty".tr);
                  }else if(startDate.isEmpty){
                    showCustomSnackBar("start_date_is_empty".tr);
                  }else if(endDate.isEmpty){
                    showCustomSnackBar("end_date_is_empty".tr);
                  }

                  else{
                    CandidateExperienceBody body = CandidateExperienceBody(
                      experienceTitle: title,
                      companyName: company,
                      companyBusiness: companyBusiness,
                      designation: designation,
                      department: department,
                      expertiseAreas: [expertiseAreas],
                      description: description,
                      startDate: startDate,
                      endDate: isCurrentlyWorking? null: endDate,
                      currentlyWorking: isCurrentlyWorking,
                      sMethod: update? "put" : "post"
                    );
                    if(update){
                      candidateExperienceController.updateCandidateExperience(body,
                          widget.candidateExperienceItem!.id!);
                    }else{
                      candidateExperienceController.createNewCandidateExperience(body);
                    }
                  }
                }, text: update? "update".tr : "save".tr))
          ],);
        }
    );
  }
}
