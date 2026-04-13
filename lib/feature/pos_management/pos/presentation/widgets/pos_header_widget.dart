import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/feature/pos_management/pos/logic/pos_controller.dart';
import 'package:ecommerce/helper/route_helper.dart';
import 'package:ecommerce/util/dimensions.dart';

class PosHeaderWidget extends StatelessWidget {
  const PosHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PosController>(builder: (posController) {


        return CustomContainer(showShadow: false, borderRadius: 0,
          child: Row(spacing: Dimensions.paddingSizeSmall, children: [


            IntrinsicWidth(child: CustomContainer(color: systemPrimaryColor(),
                showShadow: false, borderRadius: 5,
                onTap: () => Get.toNamed(RouteHelper.getDashboardRoute()),
                child: Row(spacing: Dimensions.paddingSizeSmall, children: [
                  CustomImage(svgAssetPath: Images.dashboardSvgIcon,width: 20,height: 20),
                  Text("dashboard".tr, style: textRegular.copyWith(color: Colors.white))
                ]),)),

            ],
          ),
        );
      },
    );
  }
}
