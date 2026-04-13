import 'package:ecommerce/common/widget/active_inactive_widget.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/custom_popup_menu.dart';
import 'package:ecommerce/common/widget/custom_text_item_widget.dart';
import 'package:ecommerce/common/widget/numbering_widget.dart';
import 'package:ecommerce/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/screen/add_product_screen.dart';
import 'package:ecommerce/helper/price_converter.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/helper/route_helper.dart';
import 'package:ecommerce/localization/localization_controller.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  final Product? product;
  final int index;
  const ProductWidget({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    var ltr = Get.find<LocalizationController>().isLtr;
    String imageUrl = '${AppConstants.imageBaseUrl}/product_items/${product?.thumbnail}';

    return ResponsiveHelper.isDesktop(context)?
    InkWell(
      onTap: ()=> Get.toNamed(RouteHelper.getProductDetailsRoute(id: product!.id.toString())),
      child: Row(spacing: Dimensions.paddingSizeSmall, children: [
        NumberingWidget(index: index),
        CustomImage(radius: Dimensions.paddingSizeExtraSmall, width: 50, height: 30,
            image: imageUrl),

        Expanded(child: CustomTextItemWidget(text:product?.name??'')),
        Expanded(child: CustomTextItemWidget(text: PriceConverter.convertPrice(context, product?.defaultVariant?.price??0))),
        Expanded(child: CustomTextItemWidget(text:"${product?.totalStock??0}")),
        ActiveInActiveWidget(active: product?.status == 1, onChanged: (val){

        }),

        CustomPopupMenu(
          menuItems: Get.find<DashboardController>().getPopupMenuList(product: true),
          onSelected: (val) {
            if (val.title == "view".tr) {

            }
            else if (val.title == "barcode".tr) {

            }
            else if (val.title == "edit".tr) {
              Get.to(()=> AddProductScreen(id: product!.id.toString(),));
            } else if (val.title == "delete".tr) {
              Get.find<ProductController>().deleteProduct(product!.id!);
            }
          },
        ),


      ],),
    ):

    CustomContainer(borderRadius: 5,
      onTap: ()=> Get.toNamed(RouteHelper.getProductDetailsRoute(id: product!.id.toString())),
      child: Row(spacing:  Dimensions.paddingSizeSmall, crossAxisAlignment: CrossAxisAlignment.start, children: [

        CustomImage(radius: Dimensions.paddingSizeExtraSmall,
            image: imageUrl, width: 40, height: 40),

        Expanded(child: Column(spacing: Dimensions.paddingSizeSmall, crossAxisAlignment: CrossAxisAlignment.start, children: [

          Padding(padding: EdgeInsets.only(right: ltr? 30:0, left: ltr? 0:30,),
            child: CustomTextItemWidget(text:product?.name??'',
                maxLine: 2, fontSize: Dimensions.fontSizeDefault)),

          Row(children: [
            Expanded(child: CustomTextItemWidget(text: "variant".tr)),
            Expanded(child: CustomTextItemWidget(text: "price".tr)),
            Expanded(child: CustomTextItemWidget(text: "quantity".tr)),
          ]),
          ListView.separated(
            itemCount: product?.variants?.length??0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (_, index){
              final variant = product?.variants?[index];
            return  Row(children: [
              Expanded(child: CustomTextItemWidget(text: "${variant?.name}")),
              Expanded(child: CustomTextItemWidget(text: "${variant?.price}")),
              Expanded(child: CustomTextItemWidget(text: "${variant?.stockQuantity}")),
            ]);
          }, separatorBuilder: (BuildContext context, int index) {
              return CustomDivider();
          },)



        ],),
        ),
      ],),
    );
  }
}



class ProductInfo extends StatelessWidget {
  final String infoKey;
  final String infoValue;
  final bool amount;
  final bool isQuantity;
  final double? stock;
  const ProductInfo({super.key, required this.infoKey, required this.infoValue,
    this.amount = false,  this.isQuantity = false, this.stock});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,children: [
      Text('${infoKey.tr} : ',
        style: textRegular.copyWith(color: Theme.of(context).hintColor),),

      amount?
      Text(PriceConverter.convertPrice(context, double.parse(infoValue)),
        style: textMedium.copyWith(),):
      Expanded(
        child: isQuantity?
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(infoValue, style: textRegular.copyWith(
                color: double.parse(infoValue)  < stock! ? Colors.red : null),),
            if(double.parse(infoValue)  < stock!)
              Text("${"low_stock".tr} $stock",
                style: textRegular.copyWith(color: Theme.of(context).colorScheme.error),)

          ],
        ):
        Text(infoValue, style: textRegular.copyWith(),),
      )
    ]);
  }
}
