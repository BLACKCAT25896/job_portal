import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_details_model.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/details/product_price_widget.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/vriation_section_widget.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final ProductDetailsModel? productDetailsModel;
  const TitleSection({super.key, this.productDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: Dimensions.paddingSizeDefault,
      crossAxisAlignment: CrossAxisAlignment.start,children: [
        CustomContainer(showShadow: false, borderRadius: 5,
          child: CustomImage(width: 180, height: 180,
              radius: Dimensions.paddingSizeExtraSmall,
              image: "${AppConstants.imageBaseUrl}/product_items/${productDetailsModel?.data?.thumbnail}"),
        ),
        Expanded(child: Column(spacing: Dimensions.paddingSizeDefault,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productDetailsModel?.data?.name??'',
                style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeLarge)),

            Text("${productDetailsModel?.data?.shortDescription}", style: textRegular),
            ProductPriceWidget(product: productDetailsModel!.data!),
            VariationSectionWidget(variations: productDetailsModel?.data?.variants)

          ],
        ))
      ],
    );
  }
}
