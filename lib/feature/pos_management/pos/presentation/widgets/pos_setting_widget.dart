import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_check_box_item.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_radio_button.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/common/widget/responsive_grid_widget.dart';
import 'package:ecommerce/feature/order_management/order_enum.dart';
import 'package:ecommerce/feature/pos_management/pos/logic/pos_controller.dart';
import 'package:ecommerce/feature/pos_management/pos_setting_enum.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';



class PosSettingWidget extends StatelessWidget {
  const PosSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PosController>(builder: (posController) {
      return Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: ResponsiveMasonryGrid(children: [


            CustomContainer(showShadow: false, borderRadius: 10,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeExtraSmall, children: [
                CustomTitle(title: "general", leftPadding: 0),
                Row(spacing: Dimensions.paddingSizeSmall, children: [
                  Expanded(
                    child: CheckboxItem(title: "auto_print_invoice",
                      value: posController.isEnabled(PosSetting.autoPrintInvoice),
                      onChanged: () => posController.toggle(PosSetting.autoPrintInvoice)),
                  ),

                  Expanded(
                    child: CheckboxItem(title: "order_without_login",
                      value: posController.isEnabled(PosSetting.orderWithoutLogin),
                        onChanged: () => posController.toggle(PosSetting.orderWithoutLogin)),
                  ),
                    ]),
                  const SizedBox(height: 12),

                  HorizontalRadioSelector<OrderType>(options: [
                      RadioOption(label: "Dine-In", value: OrderType.dineIn),
                      RadioOption(label: "Takeaway", value: OrderType.takeaway),
                      RadioOption(label: "Delivery", value: OrderType.delivery),
                    ],
                    selectedValue: posController.selectedOrder,
                    onChanged: (val) => posController.setSelectedOrderType(val)),
                ])),


            CustomContainer(showShadow: false, borderRadius: 10,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeDefault, children: [
                CustomTitle(title: "payment", leftPadding: 0),
                Row(spacing: Dimensions.paddingSizeSmall, children: [
                  Expanded(
                    child: CheckboxItem(title: "allow_cash",
                        value: posController.isEnabled(PosSetting.allowCash),
                        onChanged: () => posController.toggle(PosSetting.allowCash)),
                  ),

                  Expanded(
                    child: CheckboxItem(title: "allow_card",
                        value: posController.isEnabled(PosSetting.allowCard),
                        onChanged: () => posController.toggle(PosSetting.allowCard)),
                  ),
                    ]),

                Row(spacing: Dimensions.paddingSizeSmall, children: [

                  Expanded(
                    child: CheckboxItem(title: "allow_mobile_payment",
                        value: posController.isEnabled(PosSetting.allowMobilePayment),
                        onChanged: () => posController.toggle(PosSetting.allowMobilePayment)),
                  ),

                  Expanded(
                    child: CheckboxItem(title: "allow_due",
                        value: posController.isEnabled(PosSetting.allowDue),
                        onChanged: () => posController.toggle(PosSetting.allowDue)),
                  ),
                ]),
              ],)),

            // Invoice & Order Print
            CustomContainer(showShadow: false, borderRadius: 10,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeDefault, children: [

                CustomTitle(title: "invoice_and_order_print", leftPadding: 0),
                Row(spacing: Dimensions.paddingSizeSmall, children: [

                  Expanded(
                    child: CheckboxItem(title: "print_after_payment",
                        value: posController.isEnabled(PosSetting.printAfterPayment),
                        onChanged: () => posController.toggle(PosSetting.printAfterPayment)),
                  ),

                  Expanded(
                    child: CheckboxItem(title: "show_logo_on_receipt",
                        value: posController.isEnabled(PosSetting.showLogoOnReceipt),
                        onChanged: () => posController.toggle(PosSetting.showLogoOnReceipt)),
                  ),
                    ]),

                Row(spacing: Dimensions.paddingSizeSmall, children: [
                  Expanded(
                    child: CheckboxItem(title: "print_duplicate_copy",
                        value: posController.isEnabled(PosSetting.printDuplicateCopy),
                        onChanged: () => posController.toggle(PosSetting.printDuplicateCopy)),
                  ),

                  Expanded(
                    child: CheckboxItem(title: "print_kitchen_copy",
                        value: posController.isEnabled(PosSetting.printKitchenCopy),
                        onChanged: () => posController.toggle(PosSetting.printKitchenCopy)
                    ),
                  ),
                ]),
              ])),

            // Sound
          CustomContainer(showShadow: false, borderRadius: 10,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: Dimensions.paddingSizeDefault, children: [
              CustomTitle(title: "sound", leftPadding: 0),
              CheckboxItem(title: "new_order_alert_sound",
                  value: posController.isEnabled(PosSetting.newOrderAlertSound),
                  onChanged: () => posController.toggle(PosSetting.newOrderAlertSound)
              ),
              const SizedBox(height: 12),
              Text("upload_notification_sound".tr),
              Row(spacing: Dimensions.paddingSizeSmall, children: [
                CustomContainer(verticalPadding: 0, borderRadius: 5, showShadow: false,
                  color: Theme.of(context).hintColor.withValues(alpha: .2),
                  child: Text("choose_file".tr,
                    style: textRegular.copyWith(color: Theme.of(context).hintColor))),
                Text("no_file_chosen".tr),
              ])
            ])),
          ],
        ),
      );
    });
  }
}