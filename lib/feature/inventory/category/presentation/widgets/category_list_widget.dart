import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/inventory/category/controller/category_controller.dart';
import 'package:mighty_job/feature/inventory/category/domain/models/category_model.dart';
import 'package:mighty_job/feature/inventory/category/presentation/widgets/add_new_category_widget.dart';
import 'package:mighty_job/feature/inventory/category/presentation/widgets/category_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const CategoryListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(initState: (_) {
        Get.find<CategoryController>().getCategoryList(1);
      },
      builder: (controller) {
        final categoryModel = controller.categoryModel;
        final data = categoryModel?.data;

        return GenericListSection<CategoryItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<CategoryController>().getCategoryList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "category".tr,
          pathItems: ["category".tr],
          addNewTitle: "add_new_category".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "category".tr,
                child: AddNewCategoryWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: categoryModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getCategoryList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<CategoryController>().selectCategory(item);
                Get.back(result: item);
              }
            }, child: CategoryItemWidget(index: index, categoryItem: item));
          },
        );
      },
    );
  }
}
