import 'package:job/common/widget/responsive_grid_widget.dart';
import 'package:job/feature/candidate_education/controller/candidate_education_controller.dart';
import 'package:job/feature/candidate_education/domain/models/candidate_education_body.dart';
import 'package:job/feature/candidate_education/domain/models/candidate_education_model.dart';
import 'package:job/feature/degree_level/controller/degree_level_controller.dart';
import 'package:job/feature/degree_level/presentation/widgets/select_degree_level_widget.dart';
import 'package:job/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/util/dimensions.dart';

class AddNewCandidateEducationWidget extends StatefulWidget {
  final CandidateEducationItem? candidateEducationItem;
  const AddNewCandidateEducationWidget({super.key, this.candidateEducationItem});

  @override
  State<AddNewCandidateEducationWidget> createState() => _AddNewCandidateEducationWidgetState();
}

class _AddNewCandidateEducationWidgetState extends State<AddNewCandidateEducationWidget> {
  TextEditingController degreeTitleController = TextEditingController();
  TextEditingController majorNameController = TextEditingController();
  TextEditingController boardController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  TextEditingController resultController = TextEditingController();
  TextEditingController passingYearController = TextEditingController();
  TextEditingController durationYearsController = TextEditingController();
  TextEditingController achievementController = TextEditingController();

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
          SelectDegreeLevelWidget(),

          CustomTextField(controller: degreeTitleController,
            hintText: "degree_title".tr,
            title: "degree_title".tr),
          CustomTextField(controller: majorNameController,
            hintText: "major_name".tr,
            title: "major_name".tr),
          CustomTextField(controller: boardController,
            hintText: "board".tr,
            title: "board".tr),
          CustomTextField(controller: instituteController,
            hintText: "institute".tr,
            title: "institute".tr),
          CustomTextField(controller: resultController,
            hintText: "result".tr,
            title: "result".tr),
          CustomTextField(controller: passingYearController,
            hintText: "passing_year".tr,
            inputType: TextInputType.number,
            inputFormatters: [AppConstants.numberFormat],
            title: "passing_year".tr),
          CustomTextField(controller: durationYearsController,
            hintText: "duration_years".tr,
              inputType: TextInputType.number,
              inputFormatters: [AppConstants.numberFormat],
            title: "duration_years".tr),
          CustomTextField(controller: achievementController,
            hintText: "achievement".tr,
            title: "achievement".tr),


        ]),


            candidateEducationController.isLoading? Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Center(child: CircularProgressIndicator())):

            Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: CustomButton(onTap: (){

                  int? degreeLevelId = Get.find<DegreeLevelController>().selectedDegreeLevelItem?.id;
                  String degreeTitle = degreeTitleController.text.trim();
                  String majorName = majorNameController.text.trim();
                  String board = boardController.text.trim();
                  String institute = instituteController.text.trim();
                  String result = resultController.text.trim();
                  String passingYear = passingYearController.text.trim();
                  String durationYears = durationYearsController.text.trim();
                  String achievement = achievementController.text.trim();
                  if(degreeTitle.isEmpty){
                    showCustomSnackBar("degree_title_is_empty".tr);
                  }else if(majorName.isEmpty){
                    showCustomSnackBar("major_name_is_empty".tr);
                  }else if(institute.isEmpty){
                    showCustomSnackBar("institute_is_empty".tr);
                  }
                  else if(result.isEmpty){
                    showCustomSnackBar("result_is_empty".tr);
                  }
                  else if(passingYear.isEmpty){
                    showCustomSnackBar("passing_year_is_empty".tr);
                  }
                  else if(durationYears.isEmpty){
                    showCustomSnackBar("duration_years_is_empty".tr);
                  }
                  else if(achievement.isEmpty){
                    showCustomSnackBar("achievement_is_empty".tr);
                  }

                  else{
                    CandidateEducationBody body = CandidateEducationBody(
                      degreeLevelId: degreeLevelId,
                      degreeTitle: degreeTitle,
                      major: majorName,
                      board: board,
                      institute: institute,
                      result: result,
                      passingYear: int.parse(passingYear),
                      durationYears: int.parse(durationYears),
                      achievement: achievement,
                      isVerified: true,
                      status: 1,
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
