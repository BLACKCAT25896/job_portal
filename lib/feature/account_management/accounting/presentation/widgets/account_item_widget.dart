import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/account_management/accounting/presentation/widgets/create_new_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/confirmation_dialog.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_popup_widget.dart';
import 'package:ecommerce/common/widget/edit_delete_section.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/account_management/accounting/domain/model/account_model.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';
import 'package:ecommerce/feature/account_management/accounting/presentation/screen/create_new_account.dart';
import 'package:ecommerce/feature/profile/logic/profile_controller.dart';
import 'package:ecommerce/helper/date_converter.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class AccountItemWidget extends StatelessWidget {
  final AccountItem? accountItem;
  final int index;
  const AccountItemWidget({super.key, this.accountItem, required this.index});
  bool get hasEditPermission => Get.find<ProfileController>().hasPermission("account-update");
  bool get hasDeletePermission => Get.find<ProfileController>().hasPermission("account-delete");
  void _handleDelete() {
    if (accountItem?.id == null) return;
    Get.dialog(ConfirmationDialog(title: "account",
      onTap: () {
          Get.find<AccountController>().deleteAccount(int.parse(accountItem!.id!));
          Get.back();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = accountItem;
    if (item == null) return const SizedBox();

    final createdDate = item.createdAt != null ? DateConverter.quotationDate(DateTime.parse(item.createdAt!)) : "--";

    return ResponsiveHelper.isDesktop(context) ?
    _buildDesktopView(context, item, createdDate) :
    _buildMobileView(context, item, createdDate);
  }

  Widget _buildDesktopView(BuildContext context, AccountItem item, String createdDate) {
    return Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),
        Expanded(child: CustomTextItemWidget(text: item.name ?? "")),
        Expanded(child: CustomTextItemWidget(text: item.code ?? "")),
        Expanded(child: CustomTextItemWidget(text: item.type ?? "")),
        Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, item.openingBalance ?? 0))),
        Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, item.currentBalance ?? 0))),
        ActiveInActiveWidget(active: item.status == "1", onChanged: (value){
          updateStatus(value: value, id: item.id!, type: "account",
              onSuccess:  () async => await Get.find<AccountController>().getAccountList(1));
        },),

        EditDeletePopupMenu(
            onEdit: () => Get.dialog(CustomDialogWidget(title: "account".tr,
                child: CreateNewAccountWidget(accountItem: item))),
            onDelete:  _handleDelete),
      ],
    );
  }

  Widget _buildMobileView(BuildContext context, AccountItem item, String createdDate) {
    return CustomContainer(borderRadius: Dimensions.paddingSizeExtraSmall,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item.name ?? "", style: textMedium),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                Text("${"acc_number".tr} : ${item.code}", style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
              ])),

          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(PriceConverter.convertPrice(context, item.currentBalance ?? 0), style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
              EditDeleteSection(isHorizontal: true, onEdit:
                    () => Get.to(() => CreateNewAccount(accountItem: item)),
                onDelete: _handleDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
