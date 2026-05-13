
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/common/widget/custom_text_item_widget.dart';
import 'package:job/feature/job_listing/domain/models/job_listing_model.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/helper/route_helper.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class PublicJoListingItemWidget extends StatefulWidget {
  final JobListingItem? item;
  final bool fromFilter;

  const PublicJoListingItemWidget({
    super.key, this.item, this.fromFilter = false});

  @override
  State<PublicJoListingItemWidget> createState() => _PublicJoListingItemWidgetState();
}

class _PublicJoListingItemWidgetState extends State<PublicJoListingItemWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return MouseRegion(onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(onTap: () {
          Get.toNamed(RouteHelper.getJobDetailRoute(item?.id.toString() ?? ''));
        },
        child: AnimatedContainer(duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..scaleByDouble(isHovered ? 1.03 : 1.0, isHovered ? 1.03 : 1.0, isHovered ? 1.03 : 1.0, isHovered ? 1.03 : 1.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isHovered
                ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              )
            ]
                : [
              BoxShadow(
                color: Colors.black.withValues(alpha : 0.04),
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              if (!widget.fromFilter)
                CustomContainer(
                  borderRadius: 123,
                  child: CustomImage(
                    width: 50,
                    height: 50,
                    radius: 123,
                    image:
                    "${AppConstants.imageBaseUrl}/company/${item?.company?.logo}",
                  ),
                ),

              const SizedBox(width: 8),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextItemWidget(
                      text: item?.category?.name ?? 'N/A',
                      fontSize: Dimensions.fontSizeLarge,
                      color: systemPrimaryColor(),
                    ),
                    Text(
                      item?.company?.name ?? 'N/A',
                      style: textMedium.copyWith(
                        fontSize: Dimensions.fontSizeLarge,
                      ),
                    ),
                    Text(
                      item?.jobTitle ?? '',
                      style: textRegular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}