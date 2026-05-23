import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_training/controller/candidate_training_controller.dart';
import 'package:job/feature/candidate_training/domain/models/candidate_training_body.dart';
import 'package:job/feature/candidate_training/domain/models/candidate_training_model.dart';
import 'package:job/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/util/dimensions.dart';

class AddNewCandidateTrainingWidget extends StatefulWidget {
  final CandidateTrainingItem? candidateTrainingItem;
  const AddNewCandidateTrainingWidget({super.key, this.candidateTrainingItem});

  @override
  State<AddNewCandidateTrainingWidget> createState() => _AddNewCandidateTrainingWidgetState();
}

class _AddNewCandidateTrainingWidgetState extends State<AddNewCandidateTrainingWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController trainingYearController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.candidateTrainingItem != null) {
      update = true;
      titleController.text = widget.candidateTrainingItem!.title ?? "";
      topicController.text = widget.candidateTrainingItem!.topicsCovered.toString();
      durationController.text = widget.candidateTrainingItem!.durationValue.toString();
      trainingYearController.text = widget.candidateTrainingItem!.trainingYear.toString();
      instituteController.text = widget.candidateTrainingItem!.institute ?? "";
      locationController.text = widget.candidateTrainingItem!.location ?? "";
      descriptionController.text = widget.candidateTrainingItem!.description ?? "";


    }
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CandidateTrainingController>(builder: (candidateTrainingController) {
      return Column(mainAxisSize: MainAxisSize.min, children: [

        ResponsiveMasonryGrid(width: 300, children: [

          CustomTextField(controller: titleController,
            hintText: "title".tr,
            title: "title".tr),
          CustomTextField(controller: topicController,
            hintText: "topics".tr,
            title: "topics".tr),


          CustomTextField(controller: trainingYearController,
            hintText: "training_year".tr,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
            title: "training_year".tr),
          CustomTextField(controller: instituteController,
            hintText: "institute".tr,
            title: "institute".tr),
          CustomTextField(controller: durationController,
            hintText: "duration_in_month".tr,
              inputType: TextInputType.number,
              inputFormatters: [AppConstants.numberFormat],
            title: "duration_in_month".tr),
          CustomTextField(controller: locationController,
            hintText: "location".tr,
            title: "location".tr),



        ]),
        CustomTextField(controller: descriptionController,
            hintText: "description".tr,
            maxLines: 5, minLines: 3,
            inputType: TextInputType.multiline,
            inputAction: TextInputAction.newline,
            title: "description".tr),


            candidateTrainingController.isLoading? Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){
                  String title = titleController.text;
                  String topic = topicController.text;
                  String trainingYear = trainingYearController.text;
                  String institute = instituteController.text;
                  String duration = durationController.text;
                  String location = locationController.text;
                  String description = descriptionController.text;

                  if(title.isEmpty){
                    showCustomSnackBar("title".tr);
                  }

                  else if(topic.isEmpty){
                    showCustomSnackBar("topics".tr);
                  }
                  else if(trainingYear.isEmpty){
                    showCustomSnackBar("training_year".tr);
                  }
                  else if(institute.isEmpty){
                    showCustomSnackBar("institute".tr);
                  }
                  else if(duration.isEmpty){
                    showCustomSnackBar("duration".tr);
                  }
                  else if(location.isEmpty){
                    showCustomSnackBar("location".tr);
                  }


                  else{
                    CandidateTrainingBody body = CandidateTrainingBody(
                      title: title,
                      topicsCovered: [topic],
                      trainingYear: trainingYear,
                      institute: institute,
                      durationValue: duration,
                      durationType: "months",
                      location: location,
                      description: description,
                      status: 1,
                      sMethod: update? "put" : "post"
                    );
                    if(update){
                      candidateTrainingController.updateCandidateTraining(body,
                          widget.candidateTrainingItem!.id!);
                    }else{
                      candidateTrainingController.createNewCandidateTraining(body);
                    }
                  }
                }, text: update? "update".tr : "save".tr))
          ],);
        }
    );
  }
}
