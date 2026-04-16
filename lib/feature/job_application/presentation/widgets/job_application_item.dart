import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/job_application/domain/models/job_application_model.dart';
import 'package:mighty_job/feature/job_application/controller/job_application_controller.dart';
import 'package:mighty_job/feature/job_application/presentation/screens/create_new_job_application_screen.dart';
import 'package:mighty_job/feature/job_application/presentation/widgets/add_new_job_application_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobApplicationItemWidget extends StatelessWidget {
  final JobApplicationItem? applicationItem;
  final int index;
  const JobApplicationItemWidget({super.key,  required this.index, this.applicationItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: applicationItem?.jobListing?.jobTitle??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewJobApplicationWidget(applicationItem: applicationItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "application", onTap: (){
              Get.back();
              Get.find<JobApplicationController>().deleteJobApplication(applicationItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [

              Expanded(child: Text("${applicationItem?.jobListing?.jobTitle}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewJobApplicationScreen(applicationItem: applicationItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "application", onTap: (){
                      Get.back();
                      Get.find<JobApplicationController>().deleteJobApplication(applicationItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }