import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/post_category/controller/post_category_controller.dart';
import 'package:mighty_job/feature/post_category/domain/models/post_category_model.dart';
import 'package:mighty_job/feature/post_category/presentation/widgets/post_category_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectPostCategoryWidget extends StatefulWidget {
  const SelectPostCategoryWidget({super.key});

  @override
  State<SelectPostCategoryWidget> createState() => _SelectPostCategoryWidgetState();
}

class _SelectPostCategoryWidgetState extends State<SelectPostCategoryWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "postCategory", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<PostCategoryController>(initState: (_) {
        if (Get.find<PostCategoryController>().categoryModel == null) {
          Get.find<PostCategoryController>().getPostCategoryList(1);
        }
      },
        builder: (jobCategoryController) {
          return DropdownSearch<PostCategoryItem>(
            selectedItem: jobCategoryController.selectedPostCategoryItem,
            itemLabel: (item) => item.name ?? "",
            searchController: searchController,
            onSearch: (val) {
              jobCategoryController.getPostCategoryList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: PostCategoryListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
