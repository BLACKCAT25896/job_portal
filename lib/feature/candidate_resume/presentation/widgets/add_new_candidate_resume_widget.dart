import 'package:mighty_job/common/controller/date_picker_controller.dart';
import 'package:mighty_job/common/widget/custom_checkbox.dart';
import 'package:mighty_job/common/widget/date_selection_widget.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/candidate/controller/candidate_controller.dart';
import 'package:mighty_job/feature/candidate/presentation/widgets/candidate_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/candidate_resume/controller/candidate_resume_controller.dart';
import 'package:mighty_job/feature/candidate_resume/domain/models/candidate_resume_body.dart';
import 'package:mighty_job/feature/candidate_resume/domain/models/candidate_resume_model.dart';
import 'package:mighty_job/util/dimensions.dart';

class AddNewCandidateResumeWidget extends StatefulWidget {
  final CandidateResumeItem? candidateResumeItem;
  const AddNewCandidateResumeWidget({super.key, this.candidateResumeItem});

  @override
  State<AddNewCandidateResumeWidget> createState() => _AddNewCandidateResumeWidgetState();
}

class _AddNewCandidateResumeWidgetState extends State<AddNewCandidateResumeWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.candidateResumeItem != null) {
      update = true;

    }
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CandidateResumeController>(builder: (candidateResumeController) {
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
            value: candidateResumeController.isCurrentlyWorking,
            onChange: ()=> candidateResumeController.toggleCurrentlyWorking(),),


        ]),




            candidateResumeController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){
                  int? candidateId = Get.find<CandidateController>().selectedCandidateItem?.id;
                  String title = titleController.text.trim();
                  bool isCurrentlyWorking = candidateResumeController.isCurrentlyWorking;
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
                    CandidateResumeBody body = CandidateResumeBody(
                      candidateId: (candidateId),
                      sMethod: update? "put" : "post"
                    );
                    if(update){
                      candidateResumeController.updateCandidateResume(body,
                          widget.candidateResumeItem!.id!);
                    }else{
                      candidateResumeController.createNewCandidateResume(body);
                    }
                  }
                }, text: update? "update".tr : "save".tr))
          ],);
        }
    );
  }
}
