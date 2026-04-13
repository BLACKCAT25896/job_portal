import 'dart:io';

import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/common/controller/image_picker_controller.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class ImagePickerWidget extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final Color overlayColor;
  final IconData overlayIcon;
  final VoidCallback onImagePicked;
  final XFile? pickedFile;
  final String? title;
  final String? guide;
  final bool isDelete;

  const ImagePickerWidget({
    super.key,
    this.imageUrl,
    this.width = 150,
    this.height = 120,
    this.borderRadius = 8,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 0.3),
    this.overlayIcon = Icons.image_outlined,
    required this.onImagePicked,
    this.pickedFile,
    this.title, this.guide,
    this.isDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center,
      spacing: Dimensions.paddingSizeSmall, children: [
        if (title != null)
          Padding(padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(title!, style: textRegular.copyWith())),
        GetBuilder<ImagePickerController>(builder: (imagePickerController) {
            Widget imageWidget;
            if (pickedFile != null) {
              imageWidget = GetPlatform.isWeb ? Image.network(pickedFile!.path,
                  width: width, height: height, fit: BoxFit.cover) :
              Image.file(File(pickedFile!.path), width: width, height: height, fit: BoxFit.cover);
            } else {
              imageWidget = CustomImage(image: imageUrl ?? "", height: height, width: width);
            }

            return Align(alignment: Alignment.center,
              child: Stack(children: [
                  ClipRRect(borderRadius: BorderRadius.circular(borderRadius), child: imageWidget),
                  isDelete ? Positioned(top: 5,right: 5,
                      child: CustomContainer(
                          onTap: onImagePicked,showShadow: false, borderRadius: 125,color: systemPrimaryColor(),
                          child: Image.asset(Images.delete, width: 16, height: 16, color: Colors.red))):
                  Positioned.fill(child: InkWell(onTap: onImagePicked,
                    child: Container(decoration: BoxDecoration(color: overlayColor,
                        borderRadius: BorderRadius.circular(borderRadius),
                        border: Border.all(width: 1, color: systemPrimaryColor())),
                        child: Center(child: Container(padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white54),
                                shape: BoxShape.rectangle),
                            child: Icon(overlayIcon, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
      if (guide != null)
        Padding(padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(guide!, style: textRegular.copyWith(
                fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor)))
      ],
    );
  }
}