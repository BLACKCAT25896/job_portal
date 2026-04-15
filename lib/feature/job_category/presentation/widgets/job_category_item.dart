import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/job_category/controller/job_category_controller.dart';
import 'package:mighty_job/feature/job_category/domain/models/job_category_model.dart';
import 'package:mighty_job/feature/job_category/presentation/screens/create_new_job_category_screen.dart';
import 'package:mighty_job/feature/job_category/presentation/widgets/add_new_job_category_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobCategoryItemWidget extends StatelessWidget {
  final JobCategoryItem? categoryItem;
  final int index;
  const JobCategoryItemWidget({super.key,  required this.index, this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: categoryItem?.name??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewJobCategoryWidget(categoryItem: categoryItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "category", onTap: (){
              Get.back();
              Get.find<JobCategoryController>().deleteJobCategory(categoryItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [

              Expanded(child: Text("${categoryItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewJobCategoryScreen(categoryItem: categoryItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "category", onTap: (){
                      Get.back();
                      Get.find<JobCategoryController>().deleteJobCategory(categoryItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }