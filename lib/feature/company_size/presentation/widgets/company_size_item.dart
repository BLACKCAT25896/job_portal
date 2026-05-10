import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_text_item_widget.dart';
import 'package:job/common/widget/edit_delete_popup_widget.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/numbering_widget.dart';
import 'package:job/feature/company_size/controller/company_size_controller.dart';
import 'package:job/feature/company_size/domain/models/company_size_model.dart';
import 'package:job/feature/company_size/presentation/screens/create_new_company_size_screen.dart';
import 'package:job/feature/company_size/presentation/widgets/add_new_company_size_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanySizeItemWidget extends StatelessWidget {
  final CompanySizeItem? companySizeItem;
  final int index;
  const CompanySizeItemWidget({super.key,  required this.index, this.companySizeItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: companySizeItem?.name??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewCompanySizeWidget(companySizeItem: companySizeItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "company_size".tr, onTap: (){
              Get.back();
              Get.find<CompanySizeController>().deleteCompanySize(companySizeItem!.id!);
              },));

          })
    ]):

    Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


            SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Text("${companySizeItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewCompanySizeScreen(companySizeItem: companySizeItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "company_size", onTap: (){
                      Get.back();
                      Get.find<CompanySizeController>().deleteCompanySize(companySizeItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }