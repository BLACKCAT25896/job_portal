import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductPriceWidget extends StatelessWidget {
  final Product product;
  const ProductPriceWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productDetailsController) {

      double productPrice = product.defaultVariant?.price ?? 0;
      return Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
        Text(PriceConverter.convertPrice(context, productPrice,),
            style: textSemiBold.copyWith()),

        ],
        );
      }
    );
  }
}
