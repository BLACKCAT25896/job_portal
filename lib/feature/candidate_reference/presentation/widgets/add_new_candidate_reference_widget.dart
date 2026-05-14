import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_reference/controller/candidate_reference_controller.dart';
import 'package:job/feature/candidate_reference/domain/models/candidate_reference_body.dart';
import 'package:job/feature/candidate_reference/domain/models/candidate_reference_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/util/dimensions.dart';

class AddNewCandidateReferenceWidget extends StatefulWidget {
  final CandidateReferenceItem? candidateReferenceItem;
  const AddNewCandidateReferenceWidget({super.key, this.candidateReferenceItem});

  @override
  State<AddNewCandidateReferenceWidget> createState() => _AddNewCandidateReferenceWidgetState();
}

class _AddNewCandidateReferenceWidgetState extends State<AddNewCandidateReferenceWidget> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.candidateReferenceItem != null) {
      update = true;

    }
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CandidateReferenceController>(builder: (candidateReferenceController) {
      return Column(mainAxisSize: MainAxisSize.min, children: [

        ResponsiveMasonryGrid(width: 300, children: [

          CustomTextField(controller: nameController,
              hintText: "name".tr,
              inputType: TextInputType.name),
          CustomTextField(controller: phoneController,
              hintText: "phone".tr,
              inputType: TextInputType.phone),
          CustomTextField(controller: emailController,
              hintText: "email".tr,
              inputType: TextInputType.emailAddress),
          CustomTextField(controller: positionController,
              hintText: "position".tr,
              inputType: TextInputType.name),
          CustomTextField(controller: companyController,
              hintText: "company".tr,
              inputType: TextInputType.name),
          CustomTextField(controller: addressController,
              hintText: "address".tr,
              inputType: TextInputType.name),


        ]),


            candidateReferenceController.isLoading? Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){

                  String name = nameController.text.trim();
                  String phone = phoneController.text.trim();
                  String email = emailController.text.trim();
                  String position = positionController.text.trim();
                  String company = companyController.text.trim();
                  String address = addressController.text.trim();

                  if(name.isEmpty){
                    showCustomSnackBar("name_is_required".tr);
                  }
                  else if(phone.isEmpty){
                    showCustomSnackBar("phone_is_required".tr);
                  }
                  else if(email.isEmpty){
                    showCustomSnackBar("email_is_required".tr);
                  }
                  else if(position.isEmpty){
                    showCustomSnackBar("position_is_required".tr);
                  }

                  else{
                    CandidateReferenceBody body = CandidateReferenceBody(
                      name: name,
                      phone: phone,
                      email: email,
                      position: position,
                      company: company,
                      address: address,
                      status: 1,
                      sMethod: update? "put" : "post"
                    );
                    if(update){
                      candidateReferenceController.updateCandidateReference(body,
                          widget.candidateReferenceItem!.id!);
                    }else{
                      candidateReferenceController.createNewCandidateReference(body);
                    }
                  }
                }, text: update? "update".tr : "save".tr))
          ],);
        }
    );
  }
}
