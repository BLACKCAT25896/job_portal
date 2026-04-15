import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/salary_period/controller/salary_period_controller.dart';
import 'package:mighty_job/feature/salary_period/domain/models/salary_period_model.dart';
import 'package:mighty_job/feature/salary_period/presentation/screens/create_new_salary_period_screen.dart';
import 'package:mighty_job/feature/salary_period/presentation/widgets/add_new_salary_period_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaryPeriodItemWidget extends StatelessWidget {
  final SalaryPeriodItem? salaryPeriodItem;
  final int index;
  const SalaryPeriodItemWidget({super.key,  required this.index, this.salaryPeriodItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: salaryPeriodItem?.period??'')),
      Expanded(child: CustomTextItemWidget(text: salaryPeriodItem?.description??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewSalaryPeriodWidget(salaryPeriodItem: salaryPeriodItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "salary_period", onTap: (){
              Get.back();
              Get.find<SalaryPeriodController>().deleteSalaryPeriod(salaryPeriodItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Column(
                children: [
                  Text("${salaryPeriodItem?.period}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                  Text("${salaryPeriodItem?.description}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                ],
              )),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewSalaryPeriodScreen(salaryPeriodItem: salaryPeriodItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "salary_period", onTap: (){
                      Get.back();
                      Get.find<SalaryPeriodController>().deleteSalaryPeriod(salaryPeriodItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }