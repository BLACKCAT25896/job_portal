import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/industries/domain/models/industry_model.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:mighty_job/util/styles.dart';

class PublicIndustryItemWidget extends StatelessWidget {
  final IndustryItem? item;
  final int index;
  const PublicIndustryItemWidget({super.key,  required this.index, this.item});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(onTap: (){
      Get.toNamed(RouteHelper.getCategoryWiseJobRoute(slug: '', type: 'industry'));
    },
        borderRadius: 5, showShadow: false,
        child: Row(spacing: Dimensions.paddingSizeExtraSmall,
          children: [
            Icon(Icons.arrow_forward_ios_rounded, size: 12,
              color: Theme.of(context).hintColor,),
            Expanded(child: Text(item?.name??'', style: textRegular)),
          ],
        ));

  }
}