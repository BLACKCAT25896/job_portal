import 'package:job/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/controller/theme_controller.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:job/feature/language/presentation/screens/select_language_bottom_sheet.dart';
import 'package:job/feature/profile/logic/profile_controller.dart';
import 'package:job/feature/profile/presentation/widgets/header_profile_info_dropdown.dart';
import 'package:job/localization/localization_controller.dart';
import 'package:job/util/app_constants.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class WebAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (languageController) {
        return GetBuilder<ThemeController>(
          builder: (themeController) {
            return Container(
              decoration: BoxDecoration(boxShadow: ThemeShadow.getShadow(),
                color: Theme.of(context).cardColor),
              padding:  EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, Dimensions.paddingSizeSmall, 0, Dimensions.paddingSizeSmall),
              child: Row(spacing: Dimensions.paddingSizeDefault, children: [
                Spacer(),

                CustomContainer(showShadow: false, onTap: () => themeController.toggleTheme(),
                  color: Theme.of(context).hintColor.withValues(alpha: .125), borderRadius: 3,
                  child: CustomImage( image: Images.theme, isLocalAsset: true, width: 16)),

                CustomContainer(showShadow: false, onTap: () {
                      showModalBottomSheet(backgroundColor: Colors.transparent,
                          isScrollControlled: true, context: context, builder: (_)=> const SelectLanguageBottomSheet());

                    },
                  color: Theme.of(context).hintColor.withValues(alpha: .125), borderRadius: 3,
                  child: CustomImage(image: AppConstants.languages[languageController.selectIndex].imageUrl,
                    width: 16, isLocalAsset: true)),

                Container(width: 1, height: 40, color: Theme.of(context).hintColor),


                CustomContainer(showShadow: false,
                    onTap: ()=> Get.toNamed(RouteHelper.getSupportTicketRoute()),
                    color: Theme.of(context).hintColor.withValues(alpha: .125), borderRadius: 3,
                    child: CustomImage(isLocalAsset: true,width: 16,  image: Images.sms)),

                CustomContainer(showShadow: false,
                    color: Theme.of(context).hintColor.withValues(alpha: .125), borderRadius: 3,
                    child: CustomImage(isLocalAsset: true,width: 16,  image: Images.notificationIcon)),

                GetBuilder<ProfileController>(
                  builder: (profileController) {
                    return HeaderProfileInfoMenu();
                  } ),
                SizedBox(width: Dimensions.paddingSizeDefault),
              ]),
            );
          }
        );
      }
    );
  }




  @override
  Size get preferredSize => const Size(Dimensions.webMaxWidth, 70);
}

class MenuButtonWebIcon extends StatelessWidget {
  final String? icon;
  final bool isCart;
  final Function() onTap;
  const MenuButtonWebIcon({super.key, required this.icon, this.isCart = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell( onTap: onTap,
      child: Row(children: [Stack (clipBehavior: Clip.none, children: [

        Image.asset( icon!, height: 25, width: 25),

     ]),

        SizedBox(width: Dimensions.paddingSizeExtraSmall),
      ]),
    );
  }
}


