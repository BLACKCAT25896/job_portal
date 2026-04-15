import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/account_management/accounting/domain/model/account_model.dart';
import 'package:mighty_job/feature/account_management/accounting/presentation/widgets/create_new_account_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class CreateNewAccount extends StatefulWidget {
  final AccountItem? accountItem;
  const CreateNewAccount({super.key, this.accountItem});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.accountItem != null? "update_account".tr : "create_new_account".tr),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: CreateNewAccountWidget(accountItem: widget.accountItem),
        ),)
      ],),
    );
  }
}
