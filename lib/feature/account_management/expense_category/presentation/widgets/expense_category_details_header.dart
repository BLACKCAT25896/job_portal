import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/account_management/expense_category/domain/model/expense_category_details_model.dart';
import 'package:mighty_job/feature/account_management/expense_category/logic/expense_category_controller.dart';
import 'package:mighty_job/helper/price_converter.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class ExpenseCategoryDetailsHeaderSection extends StatelessWidget {
  const ExpenseCategoryDetailsHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ExpanseCategoryController>(
      builder: (expenseCategoryController) {
        ExpenseCategoryDetailsModel? expenseCategoryDetailsModel = expenseCategoryController.expenseCategoryDetailsModel;
        return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: CustomContainer(borderRadius: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [

              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('total_expense'.tr, style: textRegular.copyWith()),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Text(PriceConverter.convertPrice(context, expenseCategoryDetailsModel?.data?.expensesSumAmount??0), style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                ],
              )),
              // Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     CustomContainer(color: Theme.of(context).colorScheme.error.withValues(alpha:.1), showShadow: false,borderRadius: 123,verticalPadding: 4,
              //         child: Text('34% ${"more_expense".tr}', style: textRegular.copyWith(color: Theme.of(context).colorScheme.error))),
              //     const SizedBox(height: Dimensions.paddingSizeSmall),
              //     SizedBox(height: 20, child: Image.asset(Images.barIcon))
              //   ],
              // )),
            ],),
          ])),
        );
      }
    );
  }
}
