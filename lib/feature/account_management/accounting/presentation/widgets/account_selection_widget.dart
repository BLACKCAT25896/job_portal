import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/feature/account_management/accounting/logic/account_controller.dart';
import 'package:mighty_job/feature/account_management/accounting/presentation/widgets/account_drop_down.dart';
import 'package:mighty_job/util/dimensions.dart';

class AccountSelectionWidget extends StatefulWidget {
  final String? title;
  final bool isTo;
  const AccountSelectionWidget({super.key, this.title, this.isTo = false});

  @override
  State<AccountSelectionWidget> createState() => _AccountSelectionWidgetState();
}

class _AccountSelectionWidgetState extends State<AccountSelectionWidget> {
  @override
  void initState() {
    Get.find<AccountController>().initSelectedAccount();
    if(Get.find<AccountController>().accountModel == null){
      Get.find<AccountController>().getAccountList(1);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (accountController) {
        return Column(children: [
          const SizedBox(height: Dimensions.paddingSizeSmall),
           CustomTitle(title: widget.title ?? "account", leftPadding: 0, fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w500),

          const SizedBox(height: 8,),
          AccountDropdown(width: Get.width, title: "select".tr,
            items: accountController.accountModel?.data?.data??[],
            selectedValue: widget.isTo? accountController.toSelectedAccountItem : accountController.selectedAccountItem,
            onChanged: (val){
              accountController.selectAccount(val!, isTo: widget.isTo);
            },
          ),
        ],);
      }
    );
  }
}
