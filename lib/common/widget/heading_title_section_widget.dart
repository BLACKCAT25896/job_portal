import 'package:ecommerce/common/widget/custom_search.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';

class HeadingTitleSectionWidget extends StatelessWidget {
  final String title;
  final String actionTitle;
  final Function()? dateFilter;
  final Function()? filter;
  final Function()? reset;
  final Function()? onTap;
  final Function()? onSearch;
  final TextEditingController? searchController;

  const HeadingTitleSectionWidget({super.key, required this.title, required this.actionTitle, this.dateFilter, this.filter, this.reset, this.onTap, this.onSearch, this.searchController});

  @override
  Widget build(BuildContext context) {
    return  CustomTitle(title: title, widget: Row(children: [


      if(searchController != null)
      SizedBox(width: Get.width/2,
        child: CustomSearch(hintText: 'search'.tr, searchController: searchController!,
          onSearch: onSearch),
      ),

      if(onTap != null)
      CustomContainer(onTap: onTap, borderRadius: Dimensions.paddingSizeExtraSmall,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(actionTitle.tr, style: textRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall),)),
      SizedBox(width: Dimensions.paddingSizeSmall),
      CustomContainer(onTap: dateFilter,
          width: 40, height: 40, borderRadius: Dimensions.paddingSizeExtraSmall, child: Image.asset(Images.calender)),
      SizedBox(width: Dimensions.paddingSizeSmall),

    ],),);
  }
}
