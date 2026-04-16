import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/human_resource/recruitment/controller/recruitment_controller.dart';
import 'package:mighty_job/feature/human_resource/recruitment/domain/models/recruitment_model.dart';
import 'package:mighty_job/feature/human_resource/recruitment/presentation/widgets/recruitment_selection_widget.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_button.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/common/widget/custom_text_field.dart';
import 'package:mighty_job/feature/candidate/controller/candidate_controller.dart';
import 'package:mighty_job/feature/candidate/domain/models/candidate_body.dart';
import 'package:mighty_job/feature/candidate/domain/models/candidate_model.dart';
import 'package:mighty_job/util/dimensions.dart';

class AddNewCandidateWidget extends StatefulWidget {
  final CandidateItem? candidateItem;
  const AddNewCandidateWidget({super.key, this.candidateItem});

  @override
  State<AddNewCandidateWidget> createState() => _AddNewCandidateWidgetState();
}

class _AddNewCandidateWidgetState extends State<AddNewCandidateWidget> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.candidateItem != null) {
      update = true;
      firstNameController.text = widget.candidateItem?.firstName ?? '';
      lastNameController.text = widget.candidateItem?.lastName ?? '';
      emailController.text = widget.candidateItem?.email ?? '';
      phoneController.text = widget.candidateItem?.phone ?? '';
      notesController.text = widget.candidateItem?.notes ?? '';
      Get.find<RecruitmentController>().selectRecruitment(RecruitmentItem(
        id: widget.candidateItem?.recruitmentId,
        title: widget.candidateItem?.recruitmentTitle,
      ), notify: false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CandidateController>(builder: (candidateController) {
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

          SelectRecruitmentWidget(),


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


            candidateController.isLoading? const Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){
                  String name = firstNameController.text.trim();
                  String lastName = lastNameController.text.trim();
                  String email = emailController.text.trim();
                  String phone = phoneController.text.trim();
                  String notes = notesController.text.trim();
                  int? recruitmentId = Get.find<RecruitmentController>().selectedRecruitmentItem?.id;
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
                  }else if(recruitmentId == null){
                    showCustomSnackBar("select_recruitment".tr);
                  }
                  else{
                    CandidateBody body = CandidateBody(
                      firstName: name,
                      lastName: lastName,
                      email: email,
                      phone: phone,
                      notes: notes,
                      status: "applied",
                      recruitmentId: recruitmentId,
                      method: update? "put" : "post"
                    );
                    if(update){
                      candidateController.updateCandidate(body,  int.parse(widget.candidateItem!.id!));
                    }else{
                      candidateController.createNewCandidate(body);
                    }
                  }
                }, text: update? "update".tr : "save".tr))
          ],);
        }
    );
  }
}
