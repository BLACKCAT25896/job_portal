import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/common/widget/custom_search.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/inventory/product/logic/product_controller.dart';
import 'package:ecommerce/feature/inventory/product/presentation/widget/product_widget.dart';
import 'package:ecommerce/helper/route_helper.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListWidget extends StatefulWidget {
  final ScrollController scrollController;
  const ProductListWidget({super.key, required this.scrollController});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  final TextEditingController searchController = TextEditingController();

  Future<void> _onSearch(ProductController controller) async {
    final search = searchController.text.trim();
    if (search.isEmpty) {
      showCustomSnackBar("empty_search".tr);
      return;
    }
    await controller.getProductList(1, search: search);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(initState: (_) {
        Get.find<ProductController>().getProductList(1);
      }, builder: (controller) {
        final model = controller.productModel;
        final pagination = model?.data;
        final items = pagination?.data;

        final headings = <String>["image", "name",  "unit_price", "stock", "status"];

        return GenericListSection(
          topWidget: Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault,0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: "search",
                onSearch: () => _onSearch(controller),
                searchController: searchController),
          ),
          sectionTitle: "product_management".tr,
          pathItems: ["products".tr],
          scrollController: widget.scrollController,
          addNewTitle: "add_product".tr,
          onAddNewTap: () {
            Get.toNamed(RouteHelper.getAddNewProductsRoute());
          },
          headings: headings,
          isLoading: model == null,
          totalSize: pagination?.total ?? 0,
          offset: pagination?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getProductList(offset ?? 1);
          },
          items: items ?? [],
          itemBuilder: (item, index) {
            return ProductWidget(product: item, index: index);
          },
        );
      },
    );
  }
}
