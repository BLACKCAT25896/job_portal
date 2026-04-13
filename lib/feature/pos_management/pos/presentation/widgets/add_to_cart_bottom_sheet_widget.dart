
import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/vriation_section_widget.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class AddToCartBottomSheetWidget extends StatefulWidget {
  final Product? item;
  const AddToCartBottomSheetWidget({super.key, this.item});

  @override
  State<AddToCartBottomSheetWidget> createState() => _AddToCartBottomSheetWidgetState();
}

class _AddToCartBottomSheetWidgetState extends State<AddToCartBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productController) {
        return CustomContainer(showShadow: false,
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,children: [
              CustomImage(width: Get.width, height : 200,fit: BoxFit.contain,
                  image: "${AppConstants.imageBaseUrl}/product_items/${widget.item?.thumbnail}"),

              Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: Dimensions.paddingSizeExtraSmall,children: [
                  SizedBox(width: Get.width * 0.75,
                    child: Text(widget.item?.name??'N/A',
                        style: textMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
                        maxLines: 1,overflow: TextOverflow.ellipsis),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Row(mainAxisSize: MainAxisSize.min, spacing: Dimensions.paddingSizeSmall,
                      children: [
                        if(widget.item?.defaultVariant?.discount != 0)
                          Text(PriceConverter.convertPrice(context, widget.item?.defaultVariant?.offerPrice??0),
                              style: textRegular.copyWith(color: Theme.of(context).primaryColor)),
                        Text(PriceConverter.convertPrice(context, widget.item?.defaultVariant?.price??0),
                          style: textRegular.copyWith(
                              color: widget.item?.defaultVariant?.discount != 0? null : Theme.of(context).primaryColor,
                              decoration: widget.item?.defaultVariant?.discount != 0?
                              TextDecoration.lineThrough : TextDecoration.none),),
                      ],
                    ),
                  ]),
                  //HtmlViewer(htmlContent: widget.item?.description??''),
                ]),
              ),
              CustomContainer(showShadow: false,borderRadius: 0,
                  height: 5, width: Get.width,color: Theme.of(context).scaffoldBackgroundColor),

              CustomTitle(title: "variation".tr, leftPadding: 0,),
              CustomDivider(),
              VariationSectionWidget(item: widget.item,variations: widget.item?.variants,),



                CustomDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: Row(spacing: Dimensions.paddingSizeDefault, children: [
                  Row(spacing: Dimensions.paddingSizeExtraSmall, children: [
                    IconButton(
                        icon: Icon(Icons.remove_circle_outline_rounded),
                      onPressed: () {
                        productController.updateQuantity(widget.item!, increment: false);
                      },),
                    Text("${widget.item?.quantity ?? 1}", style: textRegular),
                    IconButton(icon: Icon(Icons.add_circle_rounded),
                      onPressed: () {
                      productController.updateQuantity(widget.item!);
                      },)
                  ]),

                  Expanded(child: CustomButton(onTap: (){
                    final List<Variants> variantList =
                        widget.item?.variants?.where((v) => v.isSelected == true).toList() ?? [];


                    Product item = Product(
                      id: widget.item?.id,
                      name: widget.item?.name,
                      thumbnail: widget.item?.thumbnail,
                      quantity: widget.item?.quantity,
                      description: widget.item?.description,
                      variants: variantList,
                    );
                    if(variantList.isEmpty){
                      showCustomSnackBar('select_variant'.tr);
                    }else {
                      Get.back();
                      Get.find<CartController>().addToCart(item);
                    }
                  }, text: "add_to_cart".tr))
                ]),
              )


            ]),
          ),
        );
      }
    );
  }
}
