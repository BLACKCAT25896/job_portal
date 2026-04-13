import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class PosCartItemWidget extends StatelessWidget {
  final Product? item;
  final int index;
  const PosCartItemWidget({super.key, this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
      final attributeText = item?.variants?.first.attributeValues != null
          ? item?.variants?.first.attributeValues!.map((attr) => attr.value ?? '').join(' / ')
          : '';
        return CustomContainer(showShadow: false, borderRadius: 5,verticalPadding: 5,
          child: Row(spacing: Dimensions.paddingSizeSmall, children: [

            CustomContainer(
                horizontalPadding: 0, verticalPadding: 0,showShadow: false,
                child: CustomImage(radius: 5,
                    image: "${AppConstants.imageBaseUrl}/product_items/${item?.thumbnail}",
                    width: 40, height: 40)),


            Expanded(child: Text(item?.name ?? '',maxLines: 2,overflow: TextOverflow.ellipsis,
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall))),

            Text(attributeText??'', maxLines: 2,overflow: TextOverflow.ellipsis,
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),


             CustomContainer(verticalPadding: 0,horizontalPadding: 0,
               border: Border.all(width: .35, color: Theme.of(context).hintColor),
               showShadow: false, borderRadius: 0,
               child: Row(mainAxisSize: MainAxisSize.min, children: [
                  CustomContainer(borderRadius: 0,showShadow: false,
                    onTap: () {
                    final qty = (item?.quantity ?? 1) + 1;
                    cartController.setQuantity(index, qty, fromButton: true);
                  }, child: Icon(Icons.add, size: 16),
                  ),


                 SizedBox(width: 50,
                     child: CustomTextField(
                       prefixIconSize: 0,
                       hintText: "1",
                       horizontalContentPadding: 5,
                       showBorder: true,
                       borderColor: Theme.of(context).hintColor,
                       controller: item?.qtyController,
                       onChanged: (val) {
                         int? qty = int.tryParse(val);
                         if (qty != null && qty > 0) {
                           cartController.setQuantity(index, qty, fromButton: false);
                         }},
                       )),

                    (item?.quantity ?? 1) == 1 ?
                    CustomContainer(borderRadius: 0,showShadow: false,
                      onTap: () => cartController.removeFromCart(index),
                      child: Icon(CupertinoIcons.delete, size: 16),
                    ) :
                    CustomContainer(borderRadius: 0,showShadow: false,
                        onTap: () {
                      final qty = (item?.quantity ?? 1) - 1;
                      cartController.setQuantity(index, qty, fromButton: true);
                      }, child: Icon(Icons.remove, size: 16)),
                  ],
                ),
             ),


            Text(PriceConverter.convertPrice(context, item?.variants?.first.price??0),
                style: textRegular.copyWith()),

          ]),
        );
      }
    );
  }
}
