import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/skill/controller/skill_controller.dart';
import 'package:mighty_job/feature/skill/domain/models/skill_model.dart';
import 'package:mighty_job/feature/skill/presentation/screens/create_new_skill_screen.dart';
import 'package:mighty_job/feature/skill/presentation/widgets/add_new_skill_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillItemWidget extends StatelessWidget {
  final SkillItem? skillItem;
  final int index;
  const SkillItemWidget({super.key,  required this.index, this.skillItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: skillItem?.name??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewSkillWidget(skillItem: skillItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "skill", onTap: (){
              Get.back();
              Get.find<SkillController>().deleteSkill(skillItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Text("${skillItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewSkillScreen(skillItem: skillItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "skill", onTap: (){
                      Get.back();
                      Get.find<SkillController>().deleteSkill(skillItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }