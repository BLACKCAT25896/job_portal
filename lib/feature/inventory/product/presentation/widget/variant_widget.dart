import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/common/widget/custom_text_field.dart';
import 'package:ecommerce/common/widget/image_picker_widget.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/attribute_selection_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/images.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariantWidget extends StatefulWidget {
  const VariantWidget({super.key});

  @override
  State<VariantWidget> createState() => _VariantWidgetState();
}

class _VariantWidgetState extends State<VariantWidget> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return GetBuilder<ProductController>(builder: (productController) {
      return CustomContainer(showShadow: false,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListView.separated(
            itemCount: productController.variants.length,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final variant = productController.variants[index];

                return CustomContainer(showShadow: false,
                  color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: .5),
                  child: Column(spacing: Dimensions.paddingSizeDefault, children: [
                      Row(spacing: Dimensions.paddingSizeDefault, children: [
                        Expanded(child: Row(spacing: Dimensions.paddingSizeDefault, children: [
                          Text("${"variants".tr}: ${index + 1}",
                              style: textSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
                          Text("default_variation".tr, style: textRegular),
                          ActiveInActiveWidget(active: variant.isDefault?? false, onChanged: (val){
                            productController.toggleDefaultVariant(index);
                          },)
                        ])),
                        if (index > 0)
                          CustomContainer(showShadow: false, borderRadius: 5,
                            onTap:  () => productController.removeVariant(index),
                            color: Theme.of(context).cardColor,
                            child: Image.asset( color:Colors.red,
                                Images.delete, width: 20, height: 20),
                          ),
                      ],),

                      Row(spacing: Dimensions.paddingSizeDefault, children: [
                          Expanded(child: CustomContainer(showShadow: false,borderRadius: 5,
                              child: Column(spacing: Dimensions.paddingSizeDefault,children: [

                                CustomTextField(
                                  title: "name".tr,
                                    hintText: "name".tr,
                                    controller: variant.nameController),

                                Row(spacing: Dimensions.paddingSizeDefault, children: [
                                  Expanded(
                                    child: CustomTextField(
                                        title: "price".tr,
                                      hintText: "price".tr,
                                      inputType: TextInputType.number,
                                      inputFormatters: [AppConstants.numberFormat],
                                      controller: variant.priceController)),

                                  Expanded(
                                    child: CustomTextField(
                                        title: "offer_price".tr,
                                      hintText: "offer_price".tr,
                                      inputType: TextInputType.number,
                                      inputFormatters: [AppConstants.numberFormat],
                                      controller: variant.offerPriceController)),
                                ]),
                                Row(spacing: Dimensions.paddingSizeDefault, children: [
                                  Expanded(
                                    child: CustomTextField(
                                        title: "discount".tr,
                                      hintText: "discount".tr,
                                      inputType: TextInputType.number,
                                      inputFormatters: [AppConstants.numberFormat],
                                      controller: variant.discountController)),

                                  Expanded(
                                    child: CustomTextField(
                                        title: "stock_alert".tr,
                                      hintText: "stock_alert".tr,
                                      inputType: TextInputType.number,
                                      inputFormatters: [AppConstants.numberFormat],
                                      controller: variant.stockAlertController)),
                                ]),
                                Row(spacing: Dimensions.paddingSizeDefault, children: [
                                  Expanded(
                                    child: CustomTextField(
                                        title: "stock".tr,
                                      hintText: "stock".tr,
                                      inputType: TextInputType.number,
                                      inputFormatters: [AppConstants.numberFormat],
                                      controller: variant.stockController)),

                                  Expanded(
                                    child: CustomTextField(
                                        title: "weight",
                                      hintText: "weight".tr,
                                      inputType: TextInputType.number,
                                      inputFormatters: [AppConstants.numberFormat],
                                      controller: variant.weightController)),
                                ]),
                                AttributeSelectionWidget(variantIndex: index)

                              ]),
                            ),
                          ),
                          if(isDesktop)
                          CustomContainer(showShadow: false, borderRadius: 5,
                              height: 380,width: 250,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 80),
                                  child: ImagePickerWidget(
                                      title: "variation_image".tr,
                                      guide: "thumbnail_image_guide".tr,
                                      pickedFile: variant.image,
                                      imageUrl: "${AppConstants.imageBaseUrl}/product_items/${variant.imageUrl}",
                                      onImagePicked: (){
                                        productController.pickVariationImage(index);
                                      }),
                                ),
                              ))
                        ],
                      ),
                    if(!isDesktop)
                      CustomContainer(showShadow: false, borderRadius: 5,
                          height: 200,width: 200,
                          child: ImagePickerWidget(
                              title: "variant_image".tr,
                              guide: "thumbnail_image_guide".tr,
                              pickedFile: variant.image,
                              imageUrl: "${AppConstants.imageBaseUrl}/product_items/${variant.imageUrl}",
                              onImagePicked: (){
                                productController.pickVariationImage(index);
                              }))
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return CustomDivider();
          }),

          const SizedBox(height: Dimensions.paddingSizeSmall),
          IntrinsicWidth(child: CustomButton(onTap: () => productController.addVariant(),
              text: "add_variant".tr)),
          ],
        ),
      );
    });
  }
}
