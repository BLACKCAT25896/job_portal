import 'package:flutter/material.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/feature/account_management/expense_category/domain/model/expense_category_model.dart';
import 'package:ecommerce/helper/date_converter.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';

class CategoryWiseExpenseWidget extends StatelessWidget {
  final Expenses? expenseItem;
  final String? name;
  final int index;
  const CategoryWiseExpenseWidget({super.key, this.expenseItem, required this.index, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, Dimensions.paddingSizeSmall, Dimensions.paddingSizeDefault, 0),
      child: ResponsiveHelper.isDesktop(context)?
      CustomContainer(borderRadius: 5,
        onTap: () {},
        child: Row(children: [
          SizedBox(width: 30, child: Image.asset(Images.edit)),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if(expenseItem?.details != null)
                Text(expenseItem?.details??'', style: textMedium.copyWith(),),
              Text(DateConverter.dateTimeStringToMonthAndYear(expenseItem!.createdAt!),
                style: textRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall),),
            ],),
          ),
          Text(PriceConverter.convertPrice(context, double.parse(expenseItem!.amount!)),
            style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),


        ],
        ),
      ):
      CustomContainer(borderRadius: 5,
        onTap: () {},
        child: Row(children: [
          SizedBox(width: 30, child: Image.asset(Images.edit)),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if(expenseItem?.details != null)
              Text(expenseItem?.details??'', style: textMedium.copyWith(),),
              Text(DateConverter.dateTimeStringToMonthAndYear(expenseItem!.createdAt!),
                style: textRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall),),
            ],),
          ),
          Text(PriceConverter.convertPrice(context, double.parse(expenseItem!.amount!)),
            style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),


        ],
        ),
      ),
    );
  }
}
