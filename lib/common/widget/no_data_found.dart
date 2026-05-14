import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_image.dart';
import 'package:lottie/lottie.dart';
import 'package:job/common/widget/custom_button.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/images.dart';
import 'package:job/util/styles.dart';

class NoDataFound extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final String? buttonText;
  final Function()? onTap;

  const NoDataFound({
    super.key,
    this.title,
    this.description,
    this.image,
    this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center, children: [
           (image != null)?
            CustomImage(isLocalAsset: true, image: image, width: 200):
          Lottie.asset(Images.noData, width: 200),

          SizedBox(height: Dimensions.paddingSizeDefault),
          Text(title ?? "no_data_found".tr,
            textAlign: TextAlign.center,
            style: textMedium.copyWith(
              fontSize: Dimensions.fontSizeLarge,
            ),
          ),

          if (description != null) ...[
            SizedBox(height: Dimensions.paddingSizeSmall),

            Text(
              description!,
              textAlign: TextAlign.center,
              style: textRegular.copyWith(
                fontSize: Dimensions.fontSizeDefault,
              ),
            ),
          ],

          if (buttonText != null && onTap != null) ...[
             SizedBox(height: Dimensions.paddingSizeLarge),
            SizedBox(width: 200, child: CustomButton(text: buttonText!, onTap: onTap)),
          ],
        ],
      ),
    );
  }
}