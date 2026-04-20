import 'package:mighty_job/common/controller/date_picker_controller.dart';
import 'package:mighty_job/common/widget/custom_checkbox.dart';
import 'package:mighty_job/common/widget/date_selection_widget.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/candidate/controller/candidate_controller.dart';
import 'package:mighty_job/feature/candidate/presentation/widgets/candidate_selection_widget.dart';
import 'package:mighty_job/feature/candidate_experience/controller/candidate_experience_controller.dart';
import 'package:mighty_job/feature/candidate_experience/domain/models/candidate_experience_body.dart';
import 'package:mighty_job/feature/candidate_experience/domain/models/candidate_experience_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/util/dimensions.dart';

class AddNewCandidateExperienceWidget extends StatefulWidget {
  final CandidateExperienceItem? candidateExperienceItem;
  const AddNewCandidateExperienceWidget({super.key, this.candidateExperienceItem});

  @override
  State<AddNewCandidateExperienceWidget> createState() => _AddNewCandidateExperienceWidgetState();
}

class _AddNewCandidateExperienceWidgetState extends State<AddNewCandidateExperienceWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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

          SelectCandidateWidget(),

          CustomTextField(title: "title".tr,
            controller: titleController,
            hintText: "title".tr,),

          CustomTextField(title: "company".tr,
            controller: companyController,
            hintText: "company".tr,),

          CustomTextField(title: "description".tr,
            controller: descriptionController,
            hintText: "description".tr,),

          DateSelectionWidget(title: "start_date".tr,),
          ExpiryDateSelectionWidget(title: "end_date".tr),

          CustomCheckbox(title: "currently_working".tr,
            value: candidateExperienceController.isCurrentlyWorking,
            onChange: ()=> candidateExperienceController.toggleCurrentlyWorking(),),


        ]),




            candidateExperienceController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){
                  int? candidateId = Get.find<CandidateController>().selectedCandidateItem?.id;
                  String title = titleController.text.trim();
                  bool isCurrentlyWorking = candidateExperienceController.isCurrentlyWorking;
                  String company = companyController.text.trim();
                  String description = descriptionController.text.trim();
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
                  }else if(candidateId == null){
                    showCustomSnackBar("select_candidate".tr);
                  }
                  else{
                    CandidateExperienceBody body = CandidateExperienceBody(
                      experienceTitle: title,
                      candidateId:(candidateId),
                      company: company,
                      description: description,
                      startDate: startDate,
                      endDate: endDate,
                      currentlyWorking: isCurrentlyWorking? 1 : 0,
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
