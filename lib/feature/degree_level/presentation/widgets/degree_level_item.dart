import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_section.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/degree_level/controller/degree_level_controller.dart';
import 'package:ecommerce/feature/degree_level/domain/models/degree_level_model.dart';
import 'package:ecommerce/feature/degree_level/presentation/screens/create_new_degree_level_screen.dart';
import 'package:ecommerce/feature/degree_level/presentation/widgets/add_new_degree_level_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DegreeLevelItemWidget extends StatelessWidget {
  final DegreeLevelItem? degreeLevelItem;
  final int index;
  const DegreeLevelItemWidget({super.key,  required this.index, this.degreeLevelItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: degreeLevelItem?.name??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewDegreeLevelWidget(degreeLevelItem: degreeLevelItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "degree_level", onTap: (){
              Get.back();
              Get.find<DegreeLevelController>().deleteDegreeLevel(degreeLevelItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Text("${degreeLevelItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewDegreeLevelScreen(degreeLevelItem: degreeLevelItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "degree_level", onTap: (){
                      Get.back();
                      Get.find<DegreeLevelController>().deleteDegreeLevel(degreeLevelItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }