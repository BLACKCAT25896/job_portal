import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/profile/domain/model/profile_model.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/util/dimensions.dart';

class EditCandidatePersonalDetailsWidget extends StatefulWidget {
  const EditCandidatePersonalDetailsWidget({super.key});

  @override
  State<EditCandidatePersonalDetailsWidget> createState() => _EditCandidatePersonalDetailsWidgetState();
}

class _EditCandidatePersonalDetailsWidgetState extends State<EditCandidatePersonalDetailsWidget> {

  TextEditingController nameController = TextEditingController();
  TextEditingController fathersNameController = TextEditingController();
  TextEditingController mothersNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController nationalIdCardController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController passportIssueDateController = TextEditingController();
  TextEditingController primaryMobileController = TextEditingController();
  TextEditingController secondaryMobileController = TextEditingController();
  TextEditingController primaryEmailController = TextEditingController();
  TextEditingController alternativeEmailController = TextEditingController();
  TextEditingController emergencyContactController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final controller = Get.find<ProfileController>();
    final data = controller.profileModel?.data;
    final candidate = data?.candidateInfo;
    if(candidate == null) return;
    nameController.text = data?.name??"";
    fathersNameController.text = candidate.fatherName??"";
    mothersNameController.text = candidate.motherName??"";
    dateOfBirthController.text = candidate.dob??"";
    genderController.text = candidate.gender??"";
    religionController.text = candidate.religion??"";
    maritalStatusController.text = candidate.maritalStatus??"";
    nationalityController.text = candidate.nationality??"";
    nationalIdCardController.text = candidate.nationalIdCard??"";
    passportNumberController.text = candidate.passportNumber??"";
    passportIssueDateController.text = candidate.passportIssueDate??"";
    primaryMobileController.text = data?.phone??"";
    secondaryMobileController.text = candidate.secondaryMobile??"";
    primaryEmailController.text = data?.email??"";
    alternativeEmailController.text = candidate.alternateEmail??"";
    emergencyContactController.text = candidate.emergencyContact??"";
    bloodGroupController.text = candidate.bloodGroup??"";
    heightController.text = candidate.height??"";
    weightController.text = candidate.weight??"";
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
          final data = profileController.profileModel?.data;
          final candidate = data?.candidateInfo;
          if(candidate == null) return Container();
            return Column(spacing: Dimensions.paddingSizeDefault, children: [

              ResponsiveMasonryGrid(children:  [
                CustomTextField(hintText: "name".tr,
                  title: "name".tr,
                  controller: nameController),

                CustomTextField(hintText: "fathers_name".tr,
                  title: "fathers_name".tr,
                  controller: fathersNameController),

                CustomTextField(hintText: "mothers_name".tr,
                  title: "mothers_name".tr,
                  controller: mothersNameController),
                CustomTextField(hintText: "date_of_birth".tr,
                  title: "date_of_birth".tr,
                  controller: dateOfBirthController),
                CustomTextField(hintText: "gender".tr,
                  title: "gender".tr,
                  controller: genderController),
                CustomTextField(hintText: "religion".tr,
                  title: "religion".tr,
                  controller: religionController),
                CustomTextField(hintText: "marital_status".tr,
                  title: "marital_status".tr,
                  controller: maritalStatusController),
                CustomTextField(hintText: "nationality".tr,
                  title: "nationality".tr,
                  controller: nationalityController),
                CustomTextField(hintText: "national_id_number".tr,
                  title: "national_id_number".tr,
                  controller: nationalIdCardController),

                CustomTextField(hintText: "passport_number".tr,
                  title: "passport_number".tr,
                  controller: passportNumberController),
                CustomTextField(hintText: "passport_expiry_date".tr,
                  title: "passport_expiry_date".tr,
                  controller: passportIssueDateController),
                CustomTextField(hintText: "primary_mobile".tr,
                  title: "primary_mobile".tr,
                  controller: primaryMobileController),
                CustomTextField(hintText: "secondary_mobile".tr,
                  title: "secondary_mobile".tr,
                  controller: secondaryMobileController),

                CustomTextField(hintText: "primary_email".tr,
                  title: "primary_email".tr,
                  controller: primaryEmailController),
                CustomTextField(hintText: "alternative_email".tr,
                  title: "alternative_email".tr,
                  controller: alternativeEmailController),

                CustomTextField(hintText: "emergency_contact".tr,
                  title: "emergency_contact".tr,
                  controller: emergencyContactController),

                CustomTextField(hintText: "blood_group".tr,
                  title: "blood_group".tr,
                  controller: bloodGroupController),
                CustomTextField(hintText: "height".tr,
                  title: "height".tr,
                  controller: heightController),
                CustomTextField(hintText: "weight".tr,
                  title: "weight".tr,
                  controller: weightController),

                ],
              ),

              profileController.isLoading? Center(child: CircularProgressIndicator()):
              CustomButton(onTap: (){
                String name = nameController.text;
                String fathersName = fathersNameController.text;
                String mothersName = mothersNameController.text;
                String dateOfBirth = dateOfBirthController.text;
                String gender = genderController.text;
                String religion = religionController.text;
                String maritalStatus = maritalStatusController.text;
                String nationality = nationalityController.text;
                String nationalIdCard = nationalIdCardController.text;
                String passportNumber = passportNumberController.text;
                String passportIssueDate = passportIssueDateController.text;
                String primaryMobile = primaryMobileController.text;
                String secondaryMobile = secondaryMobileController.text;
                String primaryEmail = primaryEmailController.text;
                String alternativeEmail = alternativeEmailController.text;
                String emergencyContact = emergencyContactController.text;
                String bloodGroup = bloodGroupController.text;
                String height = heightController.text;
                String weight = weightController.text;

                if(name.isEmpty){
                 showCustomSnackBar("name_is_empty".tr);
                }
                else if(primaryEmail.isEmpty){
                  showCustomSnackBar("primary_email_is_empty".tr);
                }else if(primaryMobile.isEmpty){
                  showCustomSnackBar("primary_mobile_is_empty".tr);
                }else{
                  CandidateInfo candidateInfo = CandidateInfo(
                    name: name,
                    fatherName: fathersName,
                    motherName: mothersName,
                    dob: dateOfBirth,
                    gender: gender,
                    religion: religion,
                    maritalStatus: maritalStatus,
                    nationality: nationality,
                    nationalIdCard: nationalIdCard,
                    passportNumber: passportNumber,
                    passportIssueDate: passportIssueDate,
                    secondaryMobile: secondaryMobile,
                    alternateEmail: alternativeEmail,
                    emergencyContact: emergencyContact,
                    bloodGroup: bloodGroup,
                    height: height,
                    weight: weight,
                    immediateAvailable: false,
                    jobAlert: false
                  );
                  profileController.updateCandidateProfile(candidateInfo);
                }
              }, text: "save".tr)
            ],);
          });
  }
}