import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/company/presentation/widgets/select_company_widget.dart';
import 'package:mighty_job/feature/job_stage/controller/job_stage_controller.dart';
import 'package:mighty_job/feature/job_stage/domain/models/job_stage_body.dart';
import 'package:mighty_job/feature/job_stage/domain/models/job_stage_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewJobStageWidget extends StatefulWidget {
  final JobStageItem? stageItem;
  const AddNewJobStageWidget({super.key, this.stageItem});

  @override
  State<AddNewJobStageWidget> createState() => _AddNewJobStageWidgetState();
}

class _AddNewJobStageWidgetState extends State<AddNewJobStageWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.stageItem != null){
      update = true;
      nameController.text = widget.stageItem?.name??'';
      descriptionController.text = widget.stageItem?.description??'';

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobStageController>(builder: (stageController) {
      return Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeDefault, children: [

        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Column(spacing: Dimensions.paddingSizeDefault, children: [

            CustomTextField(title: "name".tr,
              controller: nameController,
              hintText: "enter_name".tr,),

            CustomTextField(title: "description".tr,
              controller: descriptionController,
              hintText: "enter_description".tr,),

            SelectCompanyWidget(),


          ],),
          ),

        ]),

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: stageController.isLoading? const CircularProgressIndicator() :

            CustomButton(onTap: (){
              String name = nameController.text.trim();
              String description = descriptionController.text.trim();

              if(name.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }
              else{
                JobStageBody stageBody = JobStageBody(
                    description: description,
                    sMethod: update? "put":"POST",
                    status: 1);
                if(update){
                  stageController.updateJobStage(stageBody, widget.stageItem!.id!);
                }else{
                  stageController.createNewJobStage(stageBody);
                }
              }
              }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
