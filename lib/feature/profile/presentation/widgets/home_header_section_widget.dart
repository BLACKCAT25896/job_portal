import 'package:flutter/material.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/helper/route_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:get/get.dart';

class HomeHeaderSectionWidget extends StatelessWidget {
  const HomeHeaderSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 20;

    return Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Row(spacing: Dimensions.paddingSizeSmall, children: [



        CustomContainer(verticalPadding: 5, borderRadius: 5, showShadow: false,
            onTap: ()=> Get.toNamed(RouteHelper.getSupportTicketRoute()),
            color: Theme.of(context).cardColor.withValues(alpha: .35),
            child: CustomImage(svgAssetPath: Images.message, height: width,width: width,
                svgColor: Colors.white, fit: BoxFit.contain)),

      ]),
    );
  }
}
