
import 'package:ecommerce/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:ecommerce/common/widget/custom_app_bar.dart';
import 'package:ecommerce/common/widget/custom_floating_button.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/screen/add_product_screen.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  SearchController searchController = SearchController();
  ScrollController scrollController = ScrollController();

  Future<void> loadData() async {
    Get.find<ProductController>().getProductList(1);
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "products".tr),

      body: RefreshIndicator(onRefresh: () async {
          Get.find<ProductController>().getProductList(1);
        },
        child: Column(children: [
            Expanded(child: CustomWebScrollView(controller: scrollController, slivers: [
                SliverToBoxAdapter(child: ProductListWidget(scrollController: scrollController))
              ],)),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingButton(
          title: "add_product", onTap: ()=> Get.to(()=>  const AddProductScreen()))
    );
  }
}
