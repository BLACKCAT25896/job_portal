import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_ratting_bar_builder.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/human_resource/candidate/controller/candidate_controller.dart';
import 'package:mighty_job/feature/human_resource/candidate/presentation/widgets/candidate_selection_widget.dart';
import 'package:mighty_job/feature/human_resource/department/controller/department_controller.dart';
import 'package:mighty_job/feature/human_resource/department/presentation/widgets/department_selection_widget.dart';
import 'package:mighty_job/feature/human_resource/interview/controller/interview_controller.dart';
import 'package:mighty_job/feature/human_resource/interview/domain/models/interview_body.dart';
import 'package:mighty_job/feature/human_resource/interview/domain/models/interview_model.dart';
import 'package:mighty_job/feature/human_resource/interview/presentation/widgets/select_interview_status_widget.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewInterviewWidget extends StatefulWidget {
  final InterviewItem? interviewItem;
  const AddNewInterviewWidget({super.key, this.interviewItem});

  @override
  State<AddNewInterviewWidget> createState() => _AddNewInterviewWidgetState();
}

class _AddNewInterviewWidgetState extends State<AddNewInterviewWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  int rating = 0;
  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.interviewItem != null) {
      update = true;
      nameController.text = widget.interviewItem?.interviewerName ?? '';
      feedbackController.text = widget.interviewItem?.feedback ?? '';

    }
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<InterviewController>(builder: (controller) {
      return Column(mainAxisSize: MainAxisSize.min, children: [

        ResponsiveMasonryGrid(width: 300, children: [

          CustomTextField(title: "interviewer_name".tr,
            controller: nameController,
            hintText: "interviewer_name".tr,),

          SelectCandidateWidget(),
          SelectDepartmentWidget(),


          SelectInterviewStatusWidget(),
          CustomRatingBar(rating: rating, onRatingChanged: (val){
            setState(() {
              rating = val;
            });
          }),


        ]),

        CustomTextField(
          controller: feedbackController,
          title: "feedback".tr,
          maxLines: 5,
          minLines: 3,
          inputType: TextInputType.multiline,
          inputAction: TextInputAction.newline,
          hintText: "feedback".tr,
        ),


        controller.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String name = nameController.text.trim();
              String feedback = feedbackController.text.trim();
              String? candidateId = Get.find<CandidateController>().selectedCandidateItem?.id;
              String? departmentId = Get.find<DepartmentController>().selectedDepartmentItem?.id;
              String? status = controller.selectedInterviewStatus;
              if(name.isEmpty){
                showCustomSnackBar("first_name_is_empty".tr);
              }else if(feedback.isEmpty){
                showCustomSnackBar("feedback_is_empty".tr);
              }else if(candidateId == null){
                showCustomSnackBar("select_candidate".tr);
              }else if(departmentId == null){
                showCustomSnackBar("select_department".tr);
              }
              else{
                InterviewBody body = InterviewBody(
                  interviewerName: name,
                  feedback: feedback,
                  status: status,
                  candidateId: int.parse(candidateId),
                  departmentId: int.parse(departmentId),
                  interviewDate: DateTime.now().toString(),
                  rating: "$rating",

                );
                if(update){
                  controller.updateInterview(body,  widget.interviewItem!.id!);
                }else{
                  controller.createNewInterview(body);
                }
              }
            }, text: update? "update".tr : "save".tr))
      ],);
    }
    );
  }
}
