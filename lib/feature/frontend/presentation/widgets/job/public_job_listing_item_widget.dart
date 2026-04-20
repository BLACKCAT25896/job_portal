import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:mighty_job/util/app_constants.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class PublicJoListingItemWidget extends StatelessWidget {
  final JobListingItem? item;
  const PublicJoListingItemWidget({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(borderRadius: 5, color: Theme.of(context).cardColor,
        child: Row(spacing: Dimensions.paddingSizeExtraSmall,
          children: [
            CustomContainer(borderRadius: 123,
                child: CustomImage(width: 50, height: 50, radius: 123,
            image: "${AppConstants.imageBaseUrl}/company/${item?.company?.logo}",)),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item?.company?.name??'N/A',
                    style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
                Text(item?.jobTitle??'', style: textRegular),
              ],
            )),
          ],
        ));
  }
}
