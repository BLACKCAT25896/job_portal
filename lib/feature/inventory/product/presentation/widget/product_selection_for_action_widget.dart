import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:ecommerce/common/widget/custom_divider.dart';
import 'package:ecommerce/common/widget/custom_row.dart';
import 'package:ecommerce/common/widget/custom_search.dart';
import 'package:ecommerce/common/widget/custom_title.dart';
import 'package:ecommerce/feature/cart/presentation/widget/pos_cart_list_widget.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/pos_product_section_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSelectionForActionWidget extends StatelessWidget {
  final TextEditingController searchController;
  final ScrollController scrollController;
  const ProductSelectionForActionWidget({super.key, required this.searchController, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomContainer(showShadow: false,
          borderRadius: 5,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(spacing: Dimensions.paddingSizeDefault, children: [
            CustomTitle(title: "selected_products".tr, leftPadding: 0,
              fontSize: Dimensions.fontSizeDefault,),
            PosCartListWidget(),
          ])),

      CustomDivider(),

      Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Column(spacing: Dimensions.paddingSizeSmall, children: [
            CustomRow(title: "products".tr, widget:
            Expanded(child: CustomSearch(hintText: "search_products".tr,
                searchController: searchController,onChange: (val){
                  Get.find<ProductController>().getProductList(1, search: searchController.text);
                }, onSearch: (){
                  Get.find<ProductController>().getProductList(1, search: searchController.text);
                }),
            ),),
            PosProductSectionWidget(scrollController: scrollController),
          ])),


    ]);
  }
}
