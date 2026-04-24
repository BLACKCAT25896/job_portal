import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/candidate_education/controller/candidate_education_controller.dart';
import 'package:mighty_job/feature/candidate_education/domain/models/candidate_education_body.dart';
import 'package:mighty_job/feature/candidate_education/domain/models/candidate_education_model.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/util/dimensions.dart';

class AddNewCandidateEducationWidget extends StatefulWidget {
  final CandidateEducationItem? candidateEducationItem;
  const AddNewCandidateEducationWidget({super.key, this.candidateEducationItem});

  @override
  State<AddNewCandidateEducationWidget> createState() => _AddNewCandidateEducationWidgetState();
}

class _AddNewCandidateEducationWidgetState extends State<AddNewCandidateEducationWidget> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.candidateEducationItem != null) {
      update = true;

    }
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CandidateEducationController>(builder: (candidateEducationController) {
      return Column(mainAxisSize: MainAxisSize.min, children: [

        ResponsiveMasonryGrid(width: 300, children: [

          CustomTextField(title: "first_name".tr,
            controller: firstNameController,
            hintText: "first_name".tr,),

          CustomTextField(title: "last_name".tr,
            controller: lastNameController,
            hintText: "last_name".tr,),

          CustomTextField(title: "email".tr,
            controller: emailController,
            hintText: "email".tr,),

          CustomTextField(title: "phone".tr,
            controller: phoneController,
            inputType: TextInputType.phone,
            inputFormatters: [AppConstants.phoneNumberFormat],
            hintText: "phone".tr,),



        ]),

            CustomTextField(
              controller: notesController,
              title: "notes".tr,
              maxLines: 5,
              minLines: 3,
              inputType: TextInputType.multiline,
              inputAction: TextInputAction.newline,
              hintText: "notes".tr,
            ),


            candidateEducationController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){
                  String name = firstNameController.text.trim();
                  String lastName = lastNameController.text.trim();
                  String email = emailController.text.trim();
                  String phone = phoneController.text.trim();

                  if(name.isEmpty){
                    showCustomSnackBar("first_name_is_empty".tr);
                  }else if(lastName.trim().isEmpty){
                    showCustomSnackBar("last_name_is_empty".tr);
                  }else if(email.isEmpty){
                    showCustomSnackBar("email_is_empty".tr);
                  }else if(!GetUtils.isEmail(email)){
                    showCustomSnackBar("invalid_email".tr);
                  }else if(phone.isEmpty){
                    showCustomSnackBar("phone_is_empty".tr);
                  }
                  else{
                    CandidateEducationBody body = CandidateEducationBody(



                      sMethod: update? "put" : "post"
                    );
                    if(update){
                      candidateEducationController.updateCandidateEducation(body,
                          widget.candidateEducationItem!.id!);
                    }else{
                      candidateEducationController.createNewCandidateEducation(body);
                    }
                  }
                }, text: update? "update".tr : "save".tr))
          ],);
        }
    );
  }
}
