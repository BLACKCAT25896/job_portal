import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/account_management/deposit_category/domain/model/deposit_category_details_model.dart';
import 'package:mighty_job/feature/account_management/deposit_category/domain/model/deposit_category_model.dart';
import 'package:mighty_job/feature/account_management/deposit_category/logic/deposit_category_controller.dart';
import 'package:mighty_job/feature/account_management/deposit_category/presentation/widgets/category_wise_deposit_card.dart';
import 'package:mighty_job/feature/account_management/deposit_category/presentation/widgets/deposit_category_details_head_section.dart';
import 'package:mighty_job/feature/account_management/deposit_category/presentation/widgets/deposit_category_edit_delete_section.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class DepositCategoryDetailsWidget extends StatelessWidget {
  final DepositCategoryItem? depositCategoryItem;
  const DepositCategoryDetailsWidget({super.key, this.depositCategoryItem});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositCategoryController>(
      initState: (val) => Get.find<DepositCategoryController>().getDepositCategoryDetails(depositCategoryItem!.id!),
        builder: (depositCategoryController) {
          DepositCategoryDetailsModel? depositCategoryDetailsModel = depositCategoryController.depositCategoryDetailsModel;
          return CustomContainer(color: ResponsiveHelper.isDesktop(context)? Theme.of(context).cardColor : Colors.white,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: Dimensions.paddingSizeSmall,),
              Row(children: [
                  Expanded(child: const DepositCategoryDetailsHeaderSection()),
                  if(ResponsiveHelper.isDesktop(context) && depositCategoryItem?.id != null)
                  CustomContainer(width: 80,height: 80,borderRadius: Dimensions.paddingSizeExtraSmall, child: IconButton(onPressed: (){
                    if(depositCategoryItem?.id != null) {
                      Get.bottomSheet(DepositCategoryEditDeleteSection(depositCategoryItem: depositCategoryItem));
                    }else{
                      showCustomSnackBar( "you_cannot_edit_or_delete_message".tr);
                    }
                  },
                      icon: const Icon(Icons.more_vert_outlined)),)
                ],
              ),

              if(depositCategoryDetailsModel?.data?.deposits?.length != null)
                Padding(padding: const EdgeInsets.fromLTRB(15, 15, 15,0),
                    child: Text("${"transactions".tr}: ${depositCategoryDetailsModel?.data?.deposits?.length?? 0}",
                        style: textRegular.copyWith())),
              ListView.builder(
                  itemCount: depositCategoryDetailsModel?.data?.deposits?.length?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    Deposits? expense = depositCategoryDetailsModel?.data?.deposits?[index];
                    return  CategoryWiseDepositWidget(index: index, deposits: expense, name: depositCategoryItem?.name??'');
                  }),

            ],),
          );
        }
    );
  }
}
