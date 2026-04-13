import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_bottom_sheet.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_row.dart';
import 'package:ecommerce/feature/account_management/deposit/domain/model/deposit_model.dart';
import 'package:ecommerce/feature/account_management/deposit/logic/deposit_controller.dart';
import 'package:ecommerce/feature/account_management/deposit/presentation/screen/create_new_deposit.dart';
import 'package:ecommerce/helper/date_converter.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

class TransactionBottomSheet extends StatelessWidget {
  final DepositItem? depositItem;

  const TransactionBottomSheet({super.key, this.depositItem});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Column(children: [
        Text('transaction_details'.tr, style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge),),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
          child: Row(children: [
              Expanded(child: Text("amount".tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault))),
              Text(PriceConverter.convertPrice(context, depositItem?.amount??0),
                  style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeOverLarge)),
            ],
          ),
        ),


        CustomRow(title: "date".tr, details: DateConverter.dateTimeStringToMonthAndYear(depositItem?.createdAt??"25-08-1996"),),

        Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
          child: CustomRow(title: "category".tr, details:depositItem?.depositCategory?.name??'')),
        CustomRow(title: "note".tr, details: depositItem?.note??''),

        const SizedBox(height: Dimensions.paddingSizeOverLarge),

        Row(children: [
          Expanded(child: CustomButton(onTap: (){
            Get.back();
            Get.dialog(ConfirmationDialog(
              title: "deposit",
                content: "deposit",
                onTap: (){
               Get.find<DepositController>().deleteDeposit(int.parse(depositItem!.id!));
              Get.back();
            }));
          },
            buttonColor: Theme.of(context).colorScheme.error,
            textColor: Colors.white,
            text: "delete".tr, icon: const Icon(CupertinoIcons.delete, color: Colors.white, size: 15,),)),

          const SizedBox(width: Dimensions.paddingSizeSmall),
          Expanded(child: CustomButton(onTap: (){
            Get.back();
             Get.to(() => CreateNewDepositScreen(depositItem: depositItem));
          }, text: "edit_details".tr,
            buttonColor: Colors.transparent,
            showBorderOnly: true, borderColor: Theme.of(context).hintColor,
            textColor: Theme.of(context).textTheme.displayLarge!.color!,
            fontSize: Dimensions.fontSizeDefault,
            icon: SizedBox(height: 20, child: Image.asset(Images.edit)),)),
        ],)


      ],),
    ));
  }
}
