
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariationSectionWidget extends StatelessWidget {
  final List<Variants>? variations;
  final Product? item;

  const VariationSectionWidget({
    super.key,
    required this.variations,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (productController) {
        if (variations == null || variations!.isEmpty) {
          return const SizedBox();
        }

        return Wrap(spacing: Dimensions.paddingSizeSmall, runSpacing: 8,
          children: List.generate(variations!.length, (index) {
            final variant = variations![index];
            final attributeText = variant.attributeValues != null
                ? variant.attributeValues!.map((attr) => attr.value ?? '').join(' / ')
                : '';

            return CustomContainer(borderRadius: 5,
              color: variant.isSelected == true ?
              systemPrimaryColor(): Theme.of(context).cardColor,
              border: Border.all(width: .5, color: variant.isSelected == true ?
              systemPrimaryColor(): Theme.of(context).hintColor),
              onTap: () {
                productController.updateSelectVariant(item!, index);
              },
              showShadow: false,

              child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(attributeText, style: textMedium.copyWith(
                    color: variant.isSelected == true ? Colors.white : null)),
                  const SizedBox(width: 6),
                  Text(PriceConverter.convertPrice(context, variant.price ?? 0),
                    style: textRegular.copyWith(
                        color: variant.isSelected == true ? Colors.white : null
                    )),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}