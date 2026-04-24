import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/reported_job/controller/reported_job_controller.dart';
import 'package:mighty_job/feature/reported_job/domain/models/reported_job_body.dart';
import 'package:mighty_job/feature/reported_job/domain/models/reported_job_model.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewReportedJobWidget extends StatefulWidget {
  final ReportedJobItem? reportedJobItem;
  const AddNewReportedJobWidget({super.key, this.reportedJobItem});

  @override
  State<AddNewReportedJobWidget> createState() => _AddNewReportedJobWidgetState();
}

class _AddNewReportedJobWidgetState extends State<AddNewReportedJobWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    if(widget.reportedJobItem != null){
      update = true;


    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportedJobController>(builder: (reportedJobController) {
      return Column(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeDefault, children: [

        Row(spacing: Dimensions.paddingSizeDefault, children: [
          Expanded(child: Column(spacing: Dimensions.paddingSizeDefault, children: [

            CustomTextField(title: "name".tr,
              controller: nameController,
              hintText: "enter_name".tr,),



          ],),
          ),

        ]),

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: reportedJobController.isLoading? const CircularProgressIndicator() :

            CustomButton(onTap: (){
              String name = nameController.text.trim();

              if(name.isEmpty){
                showCustomSnackBar("name_is_empty".tr);
              }
              else{
                ReportedJobBody reportedJobBody = ReportedJobBody(

                    sMethod: update? "put":"POST",
                    );
                if(update){
                  reportedJobController.updateReportedJob(reportedJobBody, widget.reportedJobItem!.id!);
                }else{
                  reportedJobController.createNewReportedJob(reportedJobBody);
                }
              }
              }, text:  "confirm".tr))
          ],);
        }
    );
  }
}
