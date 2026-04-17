import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/post_comment/controller/post_comment_controller.dart';
import 'package:mighty_job/feature/post_comment/domain/models/post_comment_model.dart';
import 'package:mighty_job/feature/post_comment/presentation/widgets/post_comment_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCommentListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const PostCommentListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<PostCommentListWidget> createState() => _PostCommentListWidgetState();
}

class _PostCommentListWidgetState extends State<PostCommentListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostCommentController>(initState: (_) {
        Get.find<PostCommentController>().getPostCommentList(1);
      },
      builder: (controller) {
        final postCommentModel = controller.postCommentModel;
        final data = postCommentModel?.data;

        return GenericListSection<PostCommentItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<PostCommentController>().getPostCommentList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "post_comment".tr,
          pathItems: ["post_comment".tr],

          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: postCommentModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getPostCommentList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return InkWell(onTap: (){
              if(widget.fromFilter){
                Get.find<PostCommentController>().selectPostComment(item);
                Get.back(result: item);
              }
            }, child: PostCommentItemWidget(index: index, postCommentItem: item));
          },
        );
      },
    );
  }
}
