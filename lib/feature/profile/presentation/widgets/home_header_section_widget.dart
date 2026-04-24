import 'package:flutter/material.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';
import 'package:get/get.dart';

class HomeHeaderSectionWidget extends StatelessWidget {
  const HomeHeaderSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 20;

    return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Row(spacing: Dimensions.paddingSizeSmall, children: [



        CustomContainer(verticalPadding: 5, borderRadius: 5, showShadow: false,
            onTap: ()=> Get.toNamed(RouteHelper.getSupportTicketRoute()),
            color: Theme.of(context).cardColor.withValues(alpha: .35),
            child: CustomImage(svgAssetPath: Images.message, height: width,width: width,
                svgColor: Colors.white, fit: BoxFit.contain)),

        // InkWell(onTap: () => Get.toNamed(RouteHelper.getNotificationRoute()),
        //     child: CustomContainer(color: Theme.of(context).cardColor.withValues(alpha: .35),
        //         verticalPadding: 5, horizontalPadding: 5, borderRadius: 5, showShadow: false,
        //         child: CustomImage(image: Images.notification, isLocalAsset: true, height: width,width: width,))),
      ]),
    );
  }
}
