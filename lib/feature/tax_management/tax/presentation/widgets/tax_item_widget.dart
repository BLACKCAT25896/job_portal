import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/active_inactive_widget.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/edit_delete_popup_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/tax_management/tax/domain/model/tax_model.dart';
import 'package:mighty_job/feature/tax_management/tax/logic/tax_controller.dart';
import 'package:mighty_job/feature/tax_management/tax/presentation/widgets/create_new_tax_widget.dart';
import 'package:mighty_job/util/dimensions.dart';


class TaxItemWidget extends StatelessWidget {
  final TaxItem? taxItem;
  final int index;
  const TaxItemWidget({super.key, this.taxItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

        Expanded(child: CustomTextItemWidget(text:"${taxItem?.name}")),
        Expanded(child: CustomTextItemWidget(text:"${taxItem?.regNo}")),
        Expanded(child: CustomTextItemWidget(text:"${taxItem?.value}")),
        Expanded(child: Row(children: [
              ActiveInActiveWidget(active: taxItem?.isDefault == 1,
                onChanged: (val){
                updateStatus(value: val, id: taxItem!.id.toString(), type: "tax",
                    onSuccess: ()=> Get.find<TaxController>().getTax(1));

              },),
            ],
          ),
        ),


      EditDeletePopupMenu(onEdit: (){
          Get.dialog(CustomDialogWidget(title: "tax".tr,
              child: CreateNewTaxWidget(taxItem: taxItem)));
        },
        onDelete: (){
          Get.dialog(ConfirmationDialog(title: "tax", onTap: (){
                Get.back();
                Get.find<TaxController>().deleteTax(taxItem!.id!);
              }));

        },
      ),
      ]);
  }
}