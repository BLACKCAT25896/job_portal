import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/confirmation_dialog.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_popup_menu.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/common/widget/numbering_widget.dart';
import 'package:mighty_job/feature/account_management/fund/domain/model/fund_model.dart';
import 'package:mighty_job/feature/account_management/fund/logic/fund_controller.dart';
import 'package:mighty_job/feature/account_management/fund/presentation/widgets/create_new_fund_widget.dart';
import 'package:mighty_job/feature/dashboard/controller/dashboard_controller.dart';
import 'package:mighty_job/helper/price_converter.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';


class FundItemWidget extends StatelessWidget {
  final FundItem? fund;
  final int index;
  const FundItemWidget({super.key, this.fund, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
      Expanded(child: CustomTextItemWidget(text:"${fund?.name}")),
      Expanded(child: CustomTextItemWidget(text:"${fund?.type}")),
      Expanded(child: CustomTextItemWidget(text:"${fund?.code}")),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, fund?.openingBalance??0))),
      Expanded(child: CustomTextItemWidget(text:PriceConverter.convertPrice(context, fund?.currentBalance??0))),
      CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
        onSelected: (option) {
          if (option.title == "edit".tr) {
            Get.dialog(CustomDialogWidget(title: "fund".tr,
                child: CreateNewFundWidget(fund: fund)));
          } else if (option.title == "delete".tr) {
            Get.dialog(ConfirmationDialog(title: "fund", onTap: (){
                  Get.back();
                  Get.find<FundController>().deleteFund(fund!.id!);
                }));
          }
        },
        child: Icon(Icons.more_vert, color: Theme.of(context).hintColor),
      ),
      ]):CustomContainer(showShadow: false, borderRadius: 5,
        child: Column(spacing: Dimensions.paddingSizeSmall,
          children: [
            Row(spacing: Dimensions.paddingSizeDefault, children: [
            NumberingWidget(index: index),
            Expanded(child: CustomTextItemWidget(text:"${fund?.name}")),

            ]),
            Row(spacing: Dimensions.paddingSizeDefault, children: [

              Expanded(child: CustomTextItemWidget(text:"${"type".tr}: ${fund?.type}")),
              Expanded(child: CustomTextItemWidget(text:"${"code".tr}: ${fund?.code}")),

            ]),

            Row(spacing: Dimensions.paddingSizeDefault, children: [
              Expanded(child: CustomTextItemWidget(text:"${"opening_balance".tr}: ${PriceConverter.convertPrice(context, fund?.openingBalance??0)}")),
              Expanded(child: CustomTextItemWidget(text: "${"balance".tr}: ${PriceConverter.convertPrice(context, fund?.currentBalance??0)}")),
              CustomPopupMenu(menuItems: Get.find<DashboardController>().getPopupMenuList(editDelete: true),
                onSelected: (option) {
                  if (option.title == "edit".tr) {
                    Get.dialog(CustomDialogWidget(title: "fund".tr,
                        child: CreateNewFundWidget(fund: fund)));
                  } else if (option.title == "delete".tr) {
                    Get.dialog(ConfirmationDialog(title: "fund", onTap: (){
                      Get.back();
                      Get.find<FundController>().deleteFund(fund!.id!);
                    }));
                  }
                },
                child: Icon(Icons.more_vert, color: Theme.of(context).hintColor),
              ),
            ]),
          ],
        ),
      );
  }
}