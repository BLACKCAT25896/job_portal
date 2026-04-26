import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/global_widget/header_logo_section.dart';
import 'package:mighty_job/common/layout/navbar_menu_button_widget.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/common/widget/navbar_hover_dropdown.dart';
import 'package:mighty_job/feature/frontend/controller/frontend_controller.dart';
import 'package:mighty_job/feature/profile/presentation/widgets/login_option_widget.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/localization/language_model.dart';
import 'package:mighty_job/localization/localization_controller.dart';
import 'package:mighty_job/util/app_constants.dart';
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
            color: Theme.of(context).secondaryHeaderColor,
            child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
              child: Row(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeExtraLarge, children: [
                InkWell(onTap: (){
                  Get.toNamed(RouteHelper.getInitialRoute());
                }, child: const HeaderLogoSection()),

                //Expanded(child: ProductSearchHeaderWidget()),

                Spacer(),

                LoginOptionWidget()
              ]),))),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Center(child: SizedBox(width: Dimensions.webMaxWidth,
                child: Row(children: [
                  MenuButtonWeb(title: 'recruiter'.tr, onTap: () {
                    Get.toNamed(RouteHelper.getInitialRoute());
                  },),
                  MenuButtonWeb(title: 'post_a_job'.tr, onTap: () {
                    Get.toNamed(RouteHelper.getInitialRoute());
                  },),
                  Spacer(),

                  NavbarHoverDropdown<LanguageModel>(
                    button: CustomContainer(verticalPadding: 5,
                        showShadow: false,
                        color: Theme.of(context).hintColor, borderRadius: 3,
                        child: Row(spacing: Dimensions.paddingSizeSmall,
                          children: [
                            CustomImage(image: AppConstants.languages[languageController.selectIndex].imageUrl,
                                width: 25,height: 20, isLocalAsset: true),
                            Text( AppConstants.languages[languageController.selectIndex].languageName)
                          ],
                        )),
                    items: AppConstants.languages,
                    title: (item) => Row(spacing: Dimensions.paddingSizeSmall,
                        children: [
                          CustomImage(image: item.imageUrl, width: 25, height: 20, isLocalAsset: true),
                          Text(item.languageName),
                        ]),
                    onTap: (item) {
                      languageController.setLanguage(Locale(item.languageCode, item.countryCode));
                    },
                  ) ,
                  MenuButtonWeb(title: 'contact_us'.tr, onTap: () {

                  },),
                ]),)),
            ),
          ],
        );
      }
      );
    });

  }
}











