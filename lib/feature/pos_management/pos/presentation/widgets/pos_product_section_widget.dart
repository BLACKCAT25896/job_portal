import 'dart:developer';

import 'package:ecommerce/api_handle/global_api_response_model.dart';
import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/cart/logic/cart_controller.dart';
import 'package:ecommerce/feature/inventory/product/domain/model/product_model.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/add_to_cart_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_image.dart';
import 'package:ecommerce/common/widget/paginated_list_widget.dart';
import 'package:ecommerce/util/app_constants.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';

class PosProductSectionWidget extends StatelessWidget {
  final ScrollController scrollController;
  const PosProductSectionWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(initState: (val){
          if(Get.find<ProductController>().productModel == null){
            Get.find<ProductController>().getProductList(1);
          }
        },
        builder: (foodController) {
          ApiResponse<Product>? productModel = foodController.productModel;
          return productModel != null?
          PaginatedListWidget(
            scrollController: scrollController,
            offset: productModel.data?.currentPage??0,
            totalSize: productModel.data?.total??1,
            onPaginate: (int? offset)=> foodController.getProductList(offset??1),
            itemView: MasonryGridView.builder(
              crossAxisSpacing: Dimensions.paddingSizeSmall,
              mainAxisSpacing: Dimensions.paddingSizeSmall,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: productModel.data?.data?.length,
              itemBuilder: (_, index){
                Product? productItem = productModel.data?.data?[index];
                return CustomContainer(showShadow: false,borderRadius:  5,
                    onTap: (){
                  log("message===> ${productItem?.variants?.length}");
                  if((productItem?.variants?.length??0) > 1){
                    Get.dialog(CustomDialogWidget(width: 500, title: "add_to_cart".tr,
                        child: AddToCartBottomSheetWidget(item: productItem)));
                  }else{
                    Get.find<CartController>().addToCart(productItem!);
                  }},
                    child: Column(spacing: Dimensions.paddingSizeSmall, children: [
                      CustomImage(height: 100,
                          image: "${AppConstants.imageBaseUrl}/product_items/"
                              "${productItem?.thumbnail}"),
                      Text("${productItem?.name}",
                        style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall),)
                    ],));
              }, gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150),),
          ):SizedBox();
        }
    );
  }
}
