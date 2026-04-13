import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/image_picker_widget.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductThumbnailPicker extends StatelessWidget {
  final String? imageUrl;
  const ProductThumbnailPicker({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ProductController>(builder: (productController) {
      return CustomContainer(width: 300, borderRadius: 5, showShadow: false,
        height: 425, child: Center(
          child: Padding(padding: const EdgeInsets.only(top: 120),
            child: ImagePickerWidget(
                title: "product_thumbnail".tr,
                guide: "thumbnail_image_guide".tr,
                imageUrl: "${AppConstants.imageBaseUrl}/product_items/$imageUrl",
                pickedFile: productController.thumbnail,
                onImagePicked: (){
              productController.pickImage(isThumbnail: true);
            }))));
      }
    );
  }
}
