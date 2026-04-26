import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/common/widget/custom_text_item_widget.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class PublicJoListingItemWidget extends StatelessWidget {
  final JobListingItem? item;
  final bool fromFilter;
  const PublicJoListingItemWidget({super.key, this.item, this.fromFilter = false});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(onTap: (){
      log("id===>${item?.id}");
      Get.toNamed(RouteHelper.getJobDetailRoute(item?.id.toString()??''));
    },
        borderRadius: 5, color: Theme.of(context).cardColor,
        child: Row(spacing: Dimensions.paddingSizeExtraSmall,
          children: [
            if(!fromFilter)
            CustomContainer(borderRadius: 123,
                child: CustomImage(width: 50, height: 50, radius: 123,
            image: "${AppConstants.imageBaseUrl}/company/${item?.company?.logo}",)),

            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextItemWidget(text: item?.category?.name??'N/A', fontSize: Dimensions.fontSizeLarge,
                color: systemPrimaryColor()),
                Text(item?.company?.name??'N/A',
                    style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
                Text(item?.jobTitle??'', style: textRegular),
              ],
            )),
          ],
        ));
  }
}
