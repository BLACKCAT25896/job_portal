
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariationSectionWidget extends StatelessWidget {
  final List<Variants>? variations;
  final Product? item;
  const VariationSectionWidget({super.key, required this.variations, this.item});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        if (variations == null || variations!.isEmpty) return const SizedBox();

        return ListView.separated(
          itemCount: variations!.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            final variant = variations![index];

            return Align(alignment: Alignment.centerLeft,
              child: IntrinsicWidth(child: CustomContainer(
                showShadow: false,
                child: Wrap(spacing: Dimensions.paddingSizeSmall, children: [
                  Text(variant.name ?? '', style: textMedium),
                  Text(PriceConverter.convertPrice(context, variant.price ?? 0),
                        style: textRegular),
                  Icon(variant.isSelected == true ? Icons.radio_button_checked_rounded
                      : Icons.radio_button_off, size: 18, color: Theme.of(context).hintColor,),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 8),
        );
      },
    );
  }
}