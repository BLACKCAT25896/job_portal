import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_section.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/industries/controller/industry_controller.dart';
import 'package:ecommerce/feature/industries/domain/models/industry_model.dart';
import 'package:ecommerce/feature/industries/presentation/screens/create_new_industry_screen.dart';
import 'package:ecommerce/feature/industries/presentation/widgets/add_new_industry_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndustryItemWidget extends StatelessWidget {
  final IndustryItem? industryItem;
  final int index;
  const IndustryItemWidget({super.key,  required this.index, this.industryItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: industryItem?.name??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewIndustryWidget(industryItem: industryItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "industry", onTap: (){
              Get.back();
              Get.find<IndustryController>().deleteIndustry(industryItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Text("${industryItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewIndustryScreen(industryItem: industryItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "industry", onTap: (){
                      Get.back();
                      Get.find<IndustryController>().deleteIndustry(industryItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }