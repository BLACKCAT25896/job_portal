import 'dart:math';

import 'package:mighty_job/helper/app_color_helper.dart';
import 'package:mighty_job/helper/responsive_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/controller/theme_controller.dart';

const landingRegularFont = TextStyle(
  fontFamily: 'PlayfairDisplay',
  fontWeight: FontWeight.w400,
);

const landingMediumFont = TextStyle(
  fontFamily: 'PlayfairDisplay',
  fontWeight: FontWeight.w500,
);

const landingBoldFont = TextStyle(
  fontFamily: 'PlayfairDisplay',
  fontWeight: FontWeight.w700,
);


const textRegular = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w300,
);
const hintTextRegular = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w300,
  color: Color(0xFF6B7280)
);

const textHint = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w300,
    fontSize: 12,
    color: Color(0xFF979797)
);

const textMedium = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

const textSemiBold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w600,
);

const textBold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
);

const textHeavy = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w900,
);

class ThemeShadow {
  static List <BoxShadow> getShadow() {
    List<BoxShadow> boxShadow =  [
      BoxShadow(color: Get.find<ThemeController>().darkTheme? Colors.black26:
    Theme.of(Get.context!).hintColor.withValues(alpha: .25),
          blurRadius: 1,spreadRadius: 1,offset: const Offset(0,0))];
    return boxShadow;
  }

  static EdgeInsetsGeometry getPadding() {
    return EdgeInsets.symmetric(vertical: Get.height/3.5);
  }

}

TextStyle landingTextStyle(BuildContext context,
    {Color? color}) {
  return landingBoldFont.copyWith(
    fontSize: min((MediaQuery.sizeOf(context).width) * 0.05, 60),
    color: color,
  );
}

TextStyle landingSectionStyle(BuildContext context,
    {Color? color}) {
  return landingMediumFont.copyWith(color: color?? systemPrimaryColor(),
      fontSize: ResponsiveHelper.isDesktop(context)?
      MediaQuery.sizeOf(context).width * 0.015: Dimensions.fontSizeLarge);
}