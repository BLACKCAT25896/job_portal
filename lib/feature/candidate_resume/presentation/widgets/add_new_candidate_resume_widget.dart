import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/common/widget/custom_snackbar.dart';
import 'package:job/common/widget/custom_text_field.dart';
import 'package:job/feature/candidate_resume/controller/candidate_resume_controller.dart';
import 'package:job/feature/candidate_resume/domain/models/candidate_resume_body.dart';
import 'package:job/feature/candidate_resume/domain/models/candidate_resume_model.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class AddNewCandidateResumeWidget extends StatefulWidget {
  final CandidateResumeItem? candidateResumeItem;
  const AddNewCandidateResumeWidget({super.key, this.candidateResumeItem});

  @override
  State<AddNewCandidateResumeWidget> createState() => _AddNewCandidateResumeWidgetState();
}

class _AddNewCandidateResumeWidgetState extends State<AddNewCandidateResumeWidget> {
  TextEditingController titleController = TextEditingController();


  bool update = false;
  @override
  void initState() {
    super.initState();
    if(widget.candidateResumeItem != null) {
      titleController.text = widget.candidateResumeItem?.title??'';
      update = true;

    }
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CandidateResumeController>(builder: (candidateResumeController) {
      return Column(mainAxisSize: MainAxisSize.min, children: [


          CustomTextField(title: "title".tr,
            controller: titleController,
            hintText: "title".tr,),

          Padding(padding: EdgeInsets.fromLTRB(0, Dimensions.paddingSizeDefault, 0, 0),
            child: DottedBorder(
             options: RectDottedBorderOptions(
               dashPattern: const [4,5],
               color: Theme.of(context).hintColor,
             ),
              child: Container(
                padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall)),
                child: InkWell(onTap: () async{
                  await candidateResumeController.pickOtherFile(false);
                },
                  child: Builder(builder: (context) {
                    return Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center, children: [
                      SizedBox(width: 50,child: Transform.rotate(angle: 90,
                          child: Image.asset(Images.download))),
                      Text(candidateResumeController.objFile?.name ?? 'upload_resume'.tr,
                          style: textRegular),
                    ],);
                  }
                  ),
                ),
              ),
            ),
          ),





        candidateResumeController.isLoading? Padding(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Center(child: CircularProgressIndicator())):

        Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
            child: CustomButton(onTap: (){
              String title = titleController.text.trim();

              if(title.isEmpty){
                showCustomSnackBar("title_is_empty".tr);
              }else if(candidateResumeController.otherFile == null){
                showCustomSnackBar("select_file".tr);
              }
              else{
                CandidateResumeBody body = CandidateResumeBody(
                    title: title,
                    type: "uploaded",
                    isDefault: 1,
                    status: 1,
                    sMethod: update? "put" : "post"
                );
                if(update){
                  candidateResumeController.updateCandidateResume(body,
                      widget.candidateResumeItem!.id!);
                }else{
                  candidateResumeController.createNewCandidateResume(body);
                }
              }
              }, text: update? "update".tr : "save".tr))
          ],);
        }
    );
  }
}
