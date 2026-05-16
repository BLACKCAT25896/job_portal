import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate/presentation/widgets/candidate_selection_widget.dart';
import 'package:job/feature/job_application/domain/models/job_application_model.dart';
import 'package:job/feature/job_application/controller/job_application_controller.dart';
import 'package:job/feature/job_application/domain/models/job_application_body.dart';
import 'package:job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewJobApplicationWidget extends StatefulWidget {
  final JobApplicationItem? applicationItem;
  const AddNewJobApplicationWidget({super.key, this.applicationItem});

  @override
  State<AddNewJobApplicationWidget> createState() => _AddNewJobApplicationWidgetState();
}

class _AddNewJobApplicationWidgetState extends State<AddNewJobApplicationWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.applicationItem != null){
      update = true;
      nameController.text = widget.applicationItem?.jobListing?.jobTitle??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobApplicationController>(builder: (applicationController) {
      return Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeDefault, children: [

        ResponsiveMasonryGrid(children: [

          CustomTextField(title: "name".tr,
            controller: nameController,
            hintText: "enter_name".tr,),

          CustomTextField(title: "description".tr,
            controller: descriptionController,
            hintText: "enter_description".tr,),

          SelectCandidateWidget(),


        ],),

        Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: applicationController.isLoading? const CircularProgressIndicator() :

            CustomButton(onTap: (){
              String name = nameController.text.trim();

              if(name.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }
              else{
                JobApplicationBody applicationBody = JobApplicationBody(


                    sMethod: update? "put":"POST",
                    );
                if(update){
                  applicationController.updateJobApplication(applicationBody, widget.applicationItem!.id!);
                }else{
                  applicationController.createNewJobApplication(applicationBody);
                }
              }
              }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
