import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/salary_currency/controller/salary_currency_controller.dart';
import 'package:mighty_job/feature/salary_currency/domain/models/salary_currency_model.dart';
import 'package:mighty_job/feature/salary_currency/presentation/screens/create_new_salary_currency_screen.dart';
import 'package:mighty_job/feature/salary_currency/presentation/widgets/add_new_salary_currency_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaryCurrencyItemWidget extends StatelessWidget {
  final SalaryCurrencyItem? salaryCurrencyItem;
  final int index;
  const SalaryCurrencyItemWidget({super.key,  required this.index, this.salaryCurrencyItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: salaryCurrencyItem?.currencyName??'')),
      Expanded(child: CustomTextItemWidget(text: salaryCurrencyItem?.currencyCode??'')),
      Expanded(child: CustomTextItemWidget(text: salaryCurrencyItem?.currencyIcon??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewSalaryCurrencyWidget(salaryCurrencyItem: salaryCurrencyItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "salary_currency", onTap: (){
              Get.back();
              Get.find<SalaryCurrencyController>().deleteSalaryCurrency(salaryCurrencyItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Column(
                children: [
                  Text("${salaryCurrencyItem?.currencyName}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                  Text("${salaryCurrencyItem?.currencyCode}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                  Text("${salaryCurrencyItem?.currencyIcon}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                ],
              )),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewSalaryCurrencyScreen(salaryCurrencyItem: salaryCurrencyItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "salary_currency", onTap: (){
                      Get.back();
                      Get.find<SalaryCurrencyController>().deleteSalaryCurrency(salaryCurrencyItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }