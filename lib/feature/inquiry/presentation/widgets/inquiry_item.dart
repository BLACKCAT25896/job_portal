import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/confirmation_dialog.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_text_item_widget.dart';
import 'package:job/common/widget/edit_delete_popup_widget.dart';
import 'package:job/common/widget/edit_delete_section.dart';
import 'package:job/common/widget/numbering_widget.dart';
import 'package:job/feature/inquiry/controller/inquiry_controller.dart';
import 'package:job/feature/inquiry/domain/models/inquiry_model.dart';
import 'package:job/feature/inquiry/presentation/screens/create_new_inquiry_screen.dart';
import 'package:job/feature/inquiry/presentation/widgets/add_new_inquiry_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryItemWidget extends StatelessWidget {
  final InquiryItem? inquiryItem;
  final int index;
  const InquiryItemWidget({super.key,  required this.index, this.inquiryItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: inquiryItem?.name??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewInquiryWidget(inquiryItem: inquiryItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "inquiry", onTap: (){
              Get.back();
              Get.find<InquiryController>().deleteInquiry(inquiryItem!.id!);
              },));

          })
    ]):

    Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


            SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Text("${inquiryItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewInquiryScreen(inquiryItem: inquiryItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "inquiry", onTap: (){
                      Get.back();
                      Get.find<InquiryController>().deleteInquiry(inquiryItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }