
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/pos/presentation/screen/pos_checkout_screen.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/pos_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_row.dart';
import 'package:ecommerce/common/widget/custom_search.dart';
import 'package:ecommerce/feature/pos_management/pos/logic/pos_controller.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/pos_product_section_widget.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/pos_header_widget.dart';
import 'package:ecommerce/feature/pos_management/pos/presentation/widgets/pos_right_section_widget.dart';
import 'package:ecommerce/helper/responsive_helper.dart';
import 'package:ecommerce/util/dimensions.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "product".tr),
        body: GetBuilder<PosController>(builder: (posController) {
          return Column(children: [
            if(ResponsiveHelper.isDesktop(context))
            PosHeaderWidget(),
            ProductSelectionSection(scrollController: scrollController, searchController: searchController)
          ],);
          }
        ),
        floatingActionButton: CustomFloatingButton(cart: true,
          icon: Icons.shopping_cart_outlined,
          title: "checkout".tr,
          onTap: (){
          Get.to(()=> PosCheckoutScreen());
          },
        ),
    );
  }
}



class ProductSelectionSection extends StatelessWidget {
  final ScrollController scrollController;
  final TextEditingController searchController;
  const ProductSelectionSection({super.key, required this.scrollController, required this.searchController});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: Column(spacing: Dimensions.paddingSizeDefault, crossAxisAlignment: CrossAxisAlignment.start, children: [
        PosCategoryWidget(),
        Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Column(spacing: Dimensions.paddingSizeSmall,
              children: [
                CustomRow(title: "products".tr, widget:
                Expanded(
                  child: CustomSearch(hintText: "search_products".tr,
                      searchController: searchController,onChange: (val){
                        Get.find<ProductController>().getProductList(1, search: searchController.text);
                      }, onSearch: (){
                        Get.find<ProductController>().getProductList(1, search: searchController.text);
                      }),
                ),),
                SizedBox(height: isDesktop? Get.height-306 : Get.height-352,
                    child: SingleChildScrollView(controller: scrollController,
                        child: PosProductSectionWidget(scrollController: scrollController))),
              ],
            ))
      ],)),
      if(ResponsiveHelper.isDesktop(context))
        SizedBox(width: 500, child: PosRightSectionWidget()),
    ]);
  }
}
