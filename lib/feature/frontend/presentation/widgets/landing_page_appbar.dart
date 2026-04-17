

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/header_logo_section.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/feature/profile/presentation/widgets/login_option_widget.dart';
import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/localization/localization_controller.dart';
import 'package:mighty_job/util/dimensions.dart';


class LandingPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  const LandingPageAppBar({super.key, required});

  @override
  State<LandingPageAppBar> createState() => _LandingPageAppBarState();

  @override
  Size get preferredSize => const Size(Dimensions.webMaxWidth, 120);
}

class _LandingPageAppBarState extends State<LandingPageAppBar> {
  SearchController searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (languageController) {
      return GetBuilder<LandingPageController>(builder: (landingPageController) {
        return Column(children: [
          CustomContainer(borderRadius: 0, showShadow: false,
            color: systemPrimaryColor(),
            child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
              child: Row(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeExtraLarge, children: [
                InkWell(onTap: (){
                  Get.toNamed(RouteHelper.getInitialRoute());
                }, child: const HeaderLogoSection()),

                //Expanded(child: ProductSearchHeaderWidget()),


                LoginOptionWidget()
              ]),))),
            // Container(
            //   decoration: BoxDecoration(color: Theme.of(context).cardColor),
            //   child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
            //     child: Row(children: [
            //       MenuButtonWeb(title: 'home'.tr, onTap: () {
            //         Get.toNamed(RouteHelper.getInitialRoute());
            //       },),
            //       CategoryNavbarWidget(),
            //       BrandNavbarWidget(),
            //       MenuButtonWeb(title: 'contact_us'.tr, onTap: () {
            //         Get.toNamed(RouteHelper.getContactUsRoute());
            //       },),
            //     ]),)),
            // ),
          ],
        );
      }
      );
    });

  }
}





