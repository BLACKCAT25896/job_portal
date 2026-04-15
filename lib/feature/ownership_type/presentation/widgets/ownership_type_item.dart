import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_section.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/ownership_type/controller/ownership_type_controller.dart';
import 'package:mighty_job/feature/ownership_type/domain/models/ownership_type_model.dart';
import 'package:mighty_job/feature/ownership_type/presentation/screens/create_new_ownership_type_screen.dart';
import 'package:mighty_job/feature/ownership_type/presentation/widgets/add_new_ownership_type_widget.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnershipTypeItemWidget extends StatelessWidget {
  final OwnershipTypeItem? ownershipTypeItem;
  final int index;
  const OwnershipTypeItemWidget({super.key,  required this.index, this.ownershipTypeItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: ownershipTypeItem?.name??'')),

      EditDeletePopupMenu(onEdit:(){
        Get.dialog(CustomDialogWidget(child: AddNewOwnershipTypeWidget(ownershipTypeItem: ownershipTypeItem)));
      } ,
          onDelete: (){
            Get.dialog(ConfirmationDialog(title: "ownership_type", onTap: (){
              Get.back();
              Get.find<OwnershipTypeController>().deleteOwnershipType(ownershipTypeItem!.id!);
              },));

          })
    ]):

    Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Text("${ownershipTypeItem?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),
              EditDeleteSection(isHorizontal: true,
                  onEdit: (){
                Get.to(()=> CreateNewOwnershipTypeScreen(ownershipTypeItem: ownershipTypeItem));
              },
                onDelete: (){
                  Get.dialog(ConfirmationDialog(title: "ownership_type", onTap: (){
                      Get.back();
                      Get.find<OwnershipTypeController>().deleteOwnershipType(ownershipTypeItem!.id!);
                    },));

              })
            ],
          )),
    );
    }
  }