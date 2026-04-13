import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/global_widget/header_logo_section.dart';
import 'package:ecommerce/feature/dashboard/views/dashboard_screen.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final Function()? onBackPressed;
  final bool centerTitle;
  final double? fontSize;
  final Widget? actionWidget;
  final Widget? subWidget;


  const AppBarWidget({
    super.key,
     this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.centerTitle= false,
    this.fontSize, this.actionWidget, this.subWidget});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150.0),
      child: AppBar(elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: systemPrimaryColor() ,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: title!= null?
        Padding(padding: const EdgeInsets.only(left: Dimensions.paddingSizeExtraSmall),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(title!.tr, style: textRegular.copyWith(fontSize: fontSize ??
                  Dimensions.fontSizeLarge , color: Get.isDarkMode ?
              Colors.white.withValues(alpha: 0.9) : Colors.white,),
                maxLines: 1,textAlign: TextAlign.start, overflow: TextOverflow.ellipsis,),
            ],
          )):const SizedBox(),

        centerTitle: centerTitle,
        excludeHeaderSemantics: true,
        titleSpacing: 0,
        actions: [actionWidget??const SizedBox()],

        leadingWidth: 200,
        leading: showBackButton ?
        IconButton(icon: const Icon(Icons.arrow_back),
          color: Get.isDarkMode ? Colors.white.withValues(alpha:0.8) : Colors.white,
          onPressed: () => onBackPressed != null ? onBackPressed!() :
          Navigator.canPop(context) ? Get.back() : Get.offAll(()=> const DashboardScreen()),
        ) :
        HeaderLogoSection()
      ),
    );
  }

  @override
  Size get preferredSize => const Size(Dimensions.webMaxWidth, 150);
}