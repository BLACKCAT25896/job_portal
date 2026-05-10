import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Dimensions {
  Dimensions._();

  /// DEVICE TYPE
  static bool get isWeb => kIsWeb;

  static bool get isMobile => Get.width < 600;

  static bool get isTablet =>
      Get.width >= 600 && Get.width < 1024;

  static bool get isDesktop => Get.width >= 1024;

  /// RESPONSIVE HELPER
  static double responsive(
      double mobile, {
        double? tablet,
        double? desktop,
      }) {
    if (isDesktop) return desktop ?? mobile;
    if (isTablet) return tablet ?? mobile;
    return mobile;
  }

  /// FONT SIZE
  static double get fontSizeExtraSmall => responsive(
    10,
    tablet: 11,
    desktop: 12,
  );

  static double get fontSizeSmall => responsive(
    12,
    tablet: 13,
    desktop: 14,
  );

  static double get fontSizeDefault => responsive(
    14,
    tablet: 15,
    desktop: 16,
  );

  static double get fontSizeLarge => responsive(
    16,
    tablet: 17,
    desktop: 18,
  );

  static double get fontSizeExtraLarge => responsive(
    18,
    tablet: 19,
    desktop: 20,
  );

  static double get fontSizeHeading => responsive(
    20,
    tablet: 22,
    desktop: 26,
  );

  static double get fontSizeOverLarge => responsive(
    24,
    tablet: 28,
    desktop: 32,
  );

  static double get fontSizeExtraOverLarge => responsive(
    32,
    tablet: 36,
    desktop: 42,
  );

  static double get fontSizeExtraLargeTwenty => responsive(
    20,
    tablet: 22,
    desktop: 24,
  );

  static double get appbarTitle => responsive(
    30,
    tablet: 34,
    desktop: 40,
  );

  /// PADDING
  static double get paddingSizeTiny => responsive(
    3,
    desktop: 5,
  );

  static double get paddingSizeExtraExtraSmall => responsive(
    2,
    desktop: 4,
  );

  static double get paddingSizeExtraSmall => responsive(
    5,
    desktop: 8,
  );

  static double get paddingSizeSix => responsive(
    6,
    desktop: 8,
  );

  static double get paddingSizeSeven => responsive(
    7,
    desktop: 10,
  );

  static double get paddingSizeSmall => responsive(
    10,
    desktop: 14,
  );

  static double get paddingSize => responsive(
    12,
    desktop: 16,
  );

  static double get paddingSizeMedium => responsive(
    15,
    desktop: 20,
  );

  static double get paddingSizeDefault => responsive(
    15,
    desktop: 20,
  );

  static double get homePagePadding => responsive(
    20,
    desktop: 30,
  );

  static double get paddingSizeLarge => responsive(
    20,
    desktop: 28,
  );

  static double get paddingSizeExtraLarge => responsive(
    25,
    desktop: 35,
  );

  static double get paddingSizeSignUp => responsive(
    35,
    desktop: 50,
  );

  static double get paddingSizeOverLarge => responsive(
    30,
    desktop: 40,
  );

  static double get paddingSizeOver => responsive(
    50,
    desktop: 70,
  );

  /// RADIUS
  static double get radiusSmall => responsive(
    5,
    desktop: 8,
  );

  static double get radiusDefault => responsive(
    10,
    desktop: 14,
  );

  static double get radiusLarge => responsive(
    15,
    desktop: 18,
  );

  static double get radiusExtraLarge => responsive(
    20,
    desktop: 24,
  );

  /// GENERAL SIZE
  static double get listHeaderHeight => responsive(
    50,
    desktop: 60,
  );

  static double get incrementButton => responsive(
    35,
    desktop: 45,
  );

  static double get categoryImageSize => responsive(
    80,
    desktop: 100,
  );

  static double get splashLogoWidth {
    if (isDesktop) return 220;
    if (Get.width <= 400) return 120;
    return 150;
  }

  /// APPBAR
  static double get appBarHeight => responsive(
    250,
    desktop: 320,
  );

  static double get androidAppBarHeight => responsive(
    200,
    desktop: 250,
  );

  /// ICON SIZE
  static double get menuIconSize => responsive(
    20,
    desktop: 24,
  );

  static double get iconSizeSmall => responsive(
    15,
    desktop: 18,
  );

  static double get iconSizeMedium => responsive(
    20,
    desktop: 24,
  );

  static double get iconSizeDefault => responsive(
    25,
    desktop: 30,
  );

  static double get iconSizeLarge => responsive(
    25,
    desktop: 32,
  );

  static double get iconSizeExtraLarge => responsive(
    30,
    desktop: 36,
  );

  static double get iconSizeDoubleExtraLarge => responsive(
    40,
    desktop: 50,
  );

  static double get iconSizeDialog => responsive(
    60,
    desktop: 80,
  );

  /// IMAGE SIZE
  static double get profileImageSize => responsive(
    70,
    desktop: 100,
  );

  static double get productImageSize => responsive(
    70,
    desktop: 100,
  );

  static double get posProductImageSize => responsive(
    50,
    desktop: 70,
  );

  static double get imageSize => responsive(
    30,
    desktop: 40,
  );

  static double get imageSizeBig => responsive(
    50,
    desktop: 70,
  );

  /// FIXED SIZE
  static const double webMaxWidth = 1170;

  static const double identityImageWidth = 130;

  static const double identityImageHeight = 80;

  static const double rewardImageSize = 70;

  static const double rewardImageSizeOfferPage = 150;

  static const double customerReactionSize = 100;

  static const double iconSizeOnline = 100;

  static const double iconSizeOffline = 50;

  static const double roadArrowHeight = 50;

  static const double weatherIconSize = 60;

  static const double dropDownWidth = 140;

  static const double compassPadding = 50;

  static const double topSpace = 100;

  static const double topBelowSpace = 40;

  static const double orderStatusIconHeight = 70;
}