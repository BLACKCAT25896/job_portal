import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/account_management/accounting/domain/model/account_model.dart';
import 'package:ecommerce/feature/account_management/accounting/logic/account_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class AccountDropdown extends StatefulWidget {
  final double? width;
  final bool border;
  final String title;
  final List<AccountItem>? items ;
  final Function(AccountItem?)? onChanged;
  final AccountItem? selectedValue;
  const AccountDropdown({super.key, this.width, this.border = false, required this.title, this.items, this.onChanged, this.selectedValue});

  @override
  State<AccountDropdown> createState() => _AccountDropdownState();
}

class _AccountDropdownState extends State<AccountDropdown> {
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

    return Container(decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
      border: Border.all(width: .5, color: Theme.of(context).hintColor), ),
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
      child: DropdownButton2<AccountItem>(
        isExpanded: true,
        underline: const SizedBox(),
        hint: Text(widget.selectedValue?.name?? widget.title.tr, style: textRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeDefault),),
        items: (widget.items != null && widget.items!.isNotEmpty)?
        widget.items?.map((AccountItem item) => DropdownMenuItem<AccountItem>(
            value: item, child: Text("${item.name??''} - [${item.currentBalance??0}]", style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)))).toList():[],
        value: widget.selectedValue,
        onChanged: widget.onChanged,
        buttonStyleData: ButtonStyleData(padding: EdgeInsets.zero,
            height: 40, width: widget.width?? 100),
        menuItemStyleData: const MenuItemStyleData(height: 40),
      ),
    );
  }
}
