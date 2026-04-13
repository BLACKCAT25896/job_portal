import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/common/widget/custom_search.dart';
import 'package:ecommerce/feature/inventory/brand/controller/brand_controller.dart';
import 'package:ecommerce/feature/inventory/brand/domain/models/brand_model.dart';
import 'package:ecommerce/feature/inventory/brand/presentation/widgets/brand_item.dart';
import 'package:ecommerce/feature/inventory/brand/presentation/widgets/create_new_brand_widget.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandListWidget extends StatefulWidget {
  final ScrollController scrollController;

  const BrandListWidget({super.key, required this.scrollController});

  @override
  State<BrandListWidget> createState() => _BrandListWidgetState();
}

class _BrandListWidgetState extends State<BrandListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BrandController>(initState: (_) {
        Get.find<BrandController>().getBrandList(1);
      },
      builder: (controller) {
        final brandModel = controller.brandModel;
        final data = brandModel?.data?.data;

        return GenericListSection<BrandItem>(
          sectionTitle: "brand_setup".tr,
          topWidget: Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault,0 ,
              Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: "search".tr, searchController: searchController,
            onChange: (String query) async {
              if (query.trim().isEmpty) {
                Get.snackbar("Error", "empty_search".tr);
              } else {
                await controller.getBrandList(1, search: query.trim());
              }
            },),
          ),
          pathItems: ["brands".tr],
          addNewTitle: "create_new_brand".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "brand".tr,
                child: CreateNewBrandWidget()));
          },

          headings: const ["image", "name", "description",],
          scrollController: widget.scrollController,
          isLoading: brandModel == null,
          totalSize: brandModel?.data?.total ?? 0,
          offset: brandModel?.data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getBrandList(offset ?? 1);
          },

          items: data ?? [],
          itemBuilder: (item, index) {
            return BrandItemWidget(index: index, brandItem: item);
          },);
      },
    );
  }
}
