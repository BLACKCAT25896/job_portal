import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/feature/account_management/deposit/logic/deposit_controller.dart';
import 'package:ecommerce/feature/account_management/deposit/presentation/widgets/create_new_deposit_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/account_management/accounting/presentation/widgets/transaction_bottom_sheet.dart';
import 'package:ecommerce/feature/account_management/deposit/domain/model/deposit_model.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:get/get.dart';

class DepositWidget extends StatelessWidget {
  final DepositItem? depositItem;
  final int index;
  const DepositWidget({super.key, this.depositItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    InkWell(onTap: () => showModalBottomSheet(backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context, builder: (_)=>  TransactionBottomSheet(depositItem: depositItem)),
      child: Row(spacing: Dimensions.paddingSizeSmall, children: [
        NumberingWidget(index: index),
        Expanded(child: CustomTextItemWidget(text: depositItem?.account?.name??'Account')),
        Expanded(child: CustomTextItemWidget(text: depositItem?.depositCategory?.name??'Category')),
        Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, depositItem?.amount??0),)),
        Expanded(child: CustomTextItemWidget(text: depositItem?.receivedFrom??'')),
        Expanded(child: CustomTextItemWidget(text: depositItem?.note??'')),
        EditDeletePopupMenu(
            onEdit: (){
              Get.dialog(CustomDialogWidget(title: "deposit".tr,
                  child: CreateNewDepositWidget(depositItem: depositItem)));
            },
            onDelete: (){
              Get.dialog(ConfirmationDialog(
                  onTap: ()=> Get.find<DepositController>().
                  deleteDeposit(int.parse(depositItem!.id!))));
            })

      ]),
    ):

    CustomContainer(borderRadius: 5,
        onTap: () => showModalBottomSheet(backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context, builder: (_)=>  TransactionBottomSheet(depositItem: depositItem)),
      child: Row(spacing: Dimensions.paddingSizeSmall, children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomTextItemWidget(text: depositItem?.depositCategory?.name??'N/A'),
          ],),
        ),
        CustomTextItemWidget(text:PriceConverter.convertPrice(context, depositItem?.amount??0)),

      ],
      )
    );
  }
}
