import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/post_category/controller/post_category_controller.dart';
import 'package:mighty_job/feature/post_category/domain/models/post_category_model.dart';
import 'package:mighty_job/feature/post_category/presentation/widgets/add_new_post_category_widget.dart';
import 'package:mighty_job/feature/post_category/presentation/widgets/post_category_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCategoryListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const PostCategoryListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<PostCategoryListWidget> createState() => _PostCategoryListWidgetState();
}

class _PostCategoryListWidgetState extends State<PostCategoryListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostCategoryController>(initState: (_) {
        Get.find<PostCategoryController>().getPostCategoryList(1);
      },
      builder: (controller) {
        final categoryModel = controller.categoryModel;
        final data = categoryModel?.data;

        return GenericListSection<PostCategoryItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<PostCategoryController>().getPostCategoryList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "category".tr,
          pathItems: ["category".tr],
          addNewTitle: "add_new_category".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "category".tr,
                child: AddNewPostCategoryWidget()));
          },

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: categoryModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getPostCategoryList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<PostCategoryController>().selectPostCategory(item);
                Get.back(result: item);
              }
            }, child: PostCategoryItemWidget(index: index, postCategoryItem: item));
          },
        );
      },
    );
  }
}
