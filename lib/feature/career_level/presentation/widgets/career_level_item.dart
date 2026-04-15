import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/career_level/controller/career_level_controller.dart';
import 'package:mighty_job/feature/career_level/domain/models/career_level_model.dart';
import 'package:mighty_job/feature/career_level/presentation/screens/create_new_career_level_screen.dart';
import 'package:mighty_job/feature/career_level/presentation/widgets/add_new_career_level_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CareerLevelItemWidget extends StatelessWidget {
  final CareerLevelItem? careerLevelItem;
  final int index;
  const CareerLevelItemWidget({super.key,  required this.index, this.careerLevelItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: careerLevelItem?.name??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewCareerLevelWidget(careerLevelItem: careerLevelItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "career_level", onTap: (){
              Get.back();
              Get.find<CareerLevelController>().deleteCareerLevel(careerLevelItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Text("${careerLevelItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewCareerLevelScreen(careerLevelItem: careerLevelItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "career_level", onTap: (){
                      Get.back();
                      Get.find<CareerLevelController>().deleteCareerLevel(careerLevelItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }