import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/account_management/deposit_category/domain/model/deposit_category_details_model.dart';
import 'package:mighty_job/helper/date_converter.dart';
import 'package:mighty_job/helper/price_converter.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:mighty_job/util/styles.dart';

class CategoryWiseDepositWidget extends StatelessWidget {
  final Deposits? deposits;
  final String? name;
  final int index;
  const CategoryWiseDepositWidget({super.key, this.deposits, required this.index, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, Dimensions.paddingSizeSmall, Dimensions.paddingSizeDefault, 0),
      child: CustomContainer(borderRadius: 5,
        onTap: () {},
        child: Row(children: [
          SizedBox(width: 30, child: Image.asset(Images.loyalty)),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if(deposits?.notes != null)
                Text(deposits?.notes??'', style: textMedium.copyWith(),),
              Text(DateConverter.dateTimeStringToMonthAndYear(deposits!.createdAt!),
                style: textRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall),),
            ],),
          ),
          Text(PriceConverter.convertPrice(context, double.parse(deposits!.amount!)),
            style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),


        ],
        ),
      ),
    );
  }
}
