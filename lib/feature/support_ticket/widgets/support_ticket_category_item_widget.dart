import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/support_ticket/domain/models/ticket_category_model.dart';
import 'package:mighty_job/feature/support_ticket/widgets/add_new_ticket_catyegory_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/feature/support_ticket/controllers/support_ticket_controller.dart';
import 'package:mighty_job/util/dimensions.dart';


class SupportTicketCategoryItemWidget extends StatelessWidget {
  final TicketCategoryItem categoryItem;
  final int index;
   const SupportTicketCategoryItemWidget({super.key, required this.categoryItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text: categoryItem.name??'N/A')),
      Expanded(child: CustomTextItemWidget(text: categoryItem.description??'N/A')),

      EditDeletePopupMenu(
        onEdit: (){
          Get.dialog(CustomDialogWidget(title: "ticket_category".tr,
              child: AddTicketCategoryWidget(item: categoryItem)));
        }, onDelete: (){
        Get.dialog(ConfirmationDialog(title: "ticket_category",
            onTap: (){
              Get.back();
              Get.find<SupportTicketController>().deleteTicketCategory(categoryItem.id!);
            }));
      },
      )
    ]);
  }
}
