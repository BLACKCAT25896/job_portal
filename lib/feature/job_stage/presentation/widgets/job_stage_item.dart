import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/job_stage/controller/job_stage_controller.dart';
import 'package:mighty_job/feature/job_stage/domain/models/job_stage_model.dart';
import 'package:mighty_job/feature/job_stage/presentation/screens/create_new_job_stage_screen.dart';
import 'package:mighty_job/feature/job_stage/presentation/widgets/add_new_job_stage_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobStageItemWidget extends StatelessWidget {
  final JobStageItem? stageItem;
  final int index;
  const JobStageItemWidget({super.key,  required this.index, this.stageItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: stageItem?.name??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewJobStageWidget(stageItem: stageItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "stage", onTap: (){
              Get.back();
              Get.find<JobStageController>().deleteJobStage(stageItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [

              Expanded(child: Text("${stageItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewJobStageScreen(stageItem: stageItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "stage", onTap: (){
                      Get.back();
                      Get.find<JobStageController>().deleteJobStage(stageItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }