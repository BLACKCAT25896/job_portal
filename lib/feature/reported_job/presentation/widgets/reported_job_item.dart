import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/reported_job/controller/reported_job_controller.dart';
import 'package:mighty_job/feature/reported_job/domain/models/reported_job_model.dart';
import 'package:mighty_job/feature/reported_job/presentation/screens/create_new_reported_job_screen.dart';
import 'package:mighty_job/feature/reported_job/presentation/widgets/add_new_reported_job_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportedJobItemWidget extends StatelessWidget {
  final ReportedJobItem? reportedJobItem;
  final int index;
  const ReportedJobItemWidget({super.key,  required this.index, this.reportedJobItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: reportedJobItem?.note??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewReportedJobWidget(reportedJobItem: reportedJobItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "reported_job", onTap: (){
              Get.back();
              Get.find<ReportedJobController>().deleteReportedJob(reportedJobItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [

              Expanded(child: Text("${reportedJobItem?.note}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewReportedJobScreen(reportedJobItem: reportedJobItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "reported_job", onTap: (){
                      Get.back();
                      Get.find<ReportedJobController>().deleteReportedJob(reportedJobItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }