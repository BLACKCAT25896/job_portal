import 'dart:developer';
import 'dart:io';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/feature/cms_management/about_us/logic/about_us_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';

class AboutUsImageWidget extends StatelessWidget {
  const AboutUsImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AboutUsController>(
      builder: (aboutUsController) {
        log("image==> ${AppConstants.imageBaseUrl}/about_us/${aboutUsController.aboutUsModel?.data?.data?.first.image}");
        return Align(alignment: Alignment.center, child: Stack(children: [
          ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              child: aboutUsController.thumbnail != null ?  GetPlatform.isWeb? Image.network((aboutUsController.thumbnail!.path),
                width: 150, height: 120, fit: BoxFit.cover,):Image.file(File(aboutUsController.thumbnail!.path),
                width: 150, height: 120, fit: BoxFit.cover,):
               CustomImage(image: '${AppConstants.imageBaseUrl}/about_us/${aboutUsController.aboutUsModel?.data?.data?.first.image}', height: 120, width: 150)),


          Positioned(bottom: 0, right: 0, top: 0, left: 0,
              child: InkWell(onTap: () => aboutUsController.pickImage(),
                  child: Container(decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                      border: Border.all(width: 1, color: systemPrimaryColor())),
                      child: Container(margin: const EdgeInsets.all(25),
                          decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.white), shape: BoxShape.circle),
                          child: const Icon(Icons.camera_alt, color: Colors.white)))))]));
      }
    );
  }
}
