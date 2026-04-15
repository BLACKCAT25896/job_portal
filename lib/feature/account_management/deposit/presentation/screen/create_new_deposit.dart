

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_job/common/widget/custom_app_bar.dart';
import 'package:mighty_job/feature/account_management/deposit/domain/model/deposit_model.dart';
import 'package:mighty_job/feature/account_management/deposit/presentation/widgets/create_new_deposit_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class CreateNewDepositScreen extends StatefulWidget {
  final DepositItem? depositItem;
  const CreateNewDepositScreen({super.key, this.depositItem});

  @override
  State<CreateNewDepositScreen> createState() => _CreateNewDepositScreenState();
}

class _CreateNewDepositScreenState extends State<CreateNewDepositScreen> {

  bool update = false;
  @override
  void initState() {
    if(widget.depositItem != null){
      update = true;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: update? "update_deposit".tr : "create_new_deposit".tr,),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: CreateNewDepositWidget(depositItem: widget.depositItem),
        ),)
      ],),

    );
  }
}
