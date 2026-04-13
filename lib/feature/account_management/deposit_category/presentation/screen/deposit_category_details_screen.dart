import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/account_management/deposit_category/domain/model/deposit_category_model.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/widgets/deposit_category_details_widget.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/widgets/deposit_category_edit_delete_section.dart';

class DepositCategoryDetailsScreen extends StatefulWidget {
  final DepositCategoryItem? depositCategoryItem;
  const DepositCategoryDetailsScreen({super.key, this.depositCategoryItem});

  @override
  State<DepositCategoryDetailsScreen> createState() => _DepositCategoryDetailsScreenState();
}

class _DepositCategoryDetailsScreenState extends State<DepositCategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.depositCategoryItem?.name??'', actions: [
        IconButton(onPressed: (){
          if(widget.depositCategoryItem?.id != null) {
            Get.bottomSheet(DepositCategoryEditDeleteSection(depositCategoryItem: widget.depositCategoryItem));
          }else{
            showCustomSnackBar( "you_cannot_edit_or_delete_message".tr);
          }
    },
            icon: const Icon(Icons.more_vert_outlined, color: Colors.white,))
      ]),
      body: CustomWebScrollView(slivers: [
        SliverToBoxAdapter(child: DepositCategoryDetailsWidget(depositCategoryItem: widget.depositCategoryItem))
      ],),
    );
  }
}
