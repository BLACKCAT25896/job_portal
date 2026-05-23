import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_certificate/controller/candidate_certificate_controller.dart';
import 'package:job/feature/candidate_certificate/domain/models/candidate_certificate_body.dart';
import 'package:job/feature/candidate_certificate/domain/models/candidate_certificate_model.dart';
import 'package:job/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/util/dimensions.dart';

class AddNewCandidateCertificateWidget extends StatefulWidget {
  final CandidateCertificateItem? candidateCertificateItem;
  const AddNewCandidateCertificateWidget({super.key, this.candidateCertificateItem});

  @override
  State<AddNewCandidateCertificateWidget> createState() => _AddNewCandidateCertificateWidgetState();
}

class _AddNewCandidateCertificateWidgetState extends State<AddNewCandidateCertificateWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController locationController = TextEditingController();


  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.candidateCertificateItem != null) {
      update = true;
      titleController.text = widget.candidateCertificateItem?.title??'';
      instituteController.text = widget.candidateCertificateItem?.institute??'';
      durationController.text = widget.candidateCertificateItem?.durationValue?.toString()??'';
      locationController.text = widget.candidateCertificateItem?.location??'';

    }
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CandidateCertificateController>(builder: (candidateCertificateController) {
      return Column(mainAxisSize: MainAxisSize.min, children: [

        ResponsiveMasonryGrid(width: 300, children: [

          CustomTextField(controller: titleController,
            hintText: "title".tr,
            title: "title".tr),



          CustomTextField(controller: instituteController,
            hintText: "institute".tr,
            title: "institute".tr),
          CustomTextField(controller: durationController,
            hintText: "duration_in_hour".tr,
              inputType: TextInputType.number,
              inputFormatters: [AppConstants.numberFormat],
            title: "duration_in_hour".tr),
          CustomTextField(controller: locationController,
            hintText: "location".tr,
            title: "location".tr),



        ]),


            candidateCertificateController.isLoading? Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){
                  String title = titleController.text;
                  String institute = instituteController.text;
                  String duration = durationController.text;
                  String location = locationController.text;

                  if(title.isEmpty){
                    showCustomSnackBar("title".tr);
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
                    CandidateCertificateBody body = CandidateCertificateBody(
                      title: title,
                      institute: institute,
                      durationValue: duration,
                      durationType: "hours",
                      location: location,
                      status: 1,
                      sMethod: update? "put" : "post"
                    );
                    if(update){
                      candidateCertificateController.updateCandidateCertificate(body,
                          widget.candidateCertificateItem!.id!);
                    }else{
                      candidateCertificateController.createNewCandidateCertificate(body);
                    }
                  }
                }, text: update? "update".tr : "save".tr))
          ],);
        }
    );
  }
}
