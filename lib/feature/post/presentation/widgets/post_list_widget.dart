import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/post/controller/post_controller.dart';
import 'package:mighty_job/feature/post/domain/models/post_model.dart';
import 'package:mighty_job/feature/post/presentation/widgets/add_new_post_widget.dart';
import 'package:mighty_job/feature/post/presentation/widgets/post_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const PostListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(initState: (_) {
        Get.find<PostController>().getPostList(1);
      },
      builder: (controller) {
        final postModel = controller.postModel;
        final data = postModel?.data;

        return GenericListSection<PostItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<PostController>().getPostList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "post".tr,
          pathItems: ["post".tr],
          addNewTitle: "add_new_post".tr,
          onAddNewTap: () {
            Get.dialog(CustomDialogWidget(title: "post".tr,
                child: AddNewPostWidget()));
          },

          headings: const ["title", "category", "description"],
          scrollController: widget.scrollController,
          isLoading: postModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getPostList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<PostController>().selectPost(item);
                Get.back(result: item);
              }
            }, child: PostItemWidget(index: index, postItem: item));
          },
        );
      },
    );
  }
}
