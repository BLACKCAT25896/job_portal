import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_details_model.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';

class GalleryImageWidget extends StatelessWidget {
  final ProductDetailsModel? productDetailsModel;
  const GalleryImageWidget({super.key, this.productDetailsModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 70,
      child: ListView.separated(
        itemCount: productDetailsModel?.data?.gallery?.length??0,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){
          String? image = productDetailsModel?.data?.gallery?[index];
          return CustomContainer(showShadow: false,
            borderRadius: 5,verticalPadding: 5, horizontalPadding: 5,
            child: CustomImage(
                image: "${AppConstants.imageBaseUrl}/product_items/gallery/$image",
                width: 70,height: 70),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: Dimensions.paddingSizeSmall);
      },),
    );
  }
}
