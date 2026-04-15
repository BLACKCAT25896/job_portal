
import 'package:mighty_job/feature/inventory/category/controller/category_controller.dart';
import 'package:mighty_job/feature/inventory/category/domain/models/category_model.dart';
import 'package:mighty_job/feature/inventory/category/presentation/widgets/category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';

class SelectCategoryWidget extends StatefulWidget {
  final String? title;
  const SelectCategoryWidget({super.key, this.title});

  @override
  State<SelectCategoryWidget> createState() => _SelectCategoryWidgetState();
}

class _SelectCategoryWidgetState extends State<SelectCategoryWidget> {
  final searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (categoryController) {
          return DropdownSearch<CategoryItem>(
            sectionTitle: widget.title?? "category".tr,
            selectedItem: categoryController.selectedCategoryItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              categoryController.getCategoryList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
              child: CategoryListWidget(fromFilter: true,
                  scrollController: scrollController),
            ),
          );
        }
    );
  }
}
