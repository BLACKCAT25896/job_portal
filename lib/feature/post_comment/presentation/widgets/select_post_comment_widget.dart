import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_title.dart';
import 'package:mighty_job/common/widget/dropdown_with_search_widget.dart';
import 'package:mighty_job/feature/post/controller/post_controller.dart';
import 'package:mighty_job/feature/post/domain/models/post_model.dart';
import 'package:mighty_job/feature/post/presentation/widgets/post_list_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class SelectPostWidget extends StatefulWidget {
  const SelectPostWidget({super.key});

  @override
  State<SelectPostWidget> createState() => _SelectPostWidgetState();
}

class _SelectPostWidgetState extends State<SelectPostWidget> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      SizedBox(height: Dimensions.paddingSizeSmall),
      CustomTitle(title: "post", leftPadding: 0, fontSize: Dimensions.fontSizeDefault),

      GetBuilder<PostController>(initState: (_) {
        if (Get.find<PostController>().postModel == null) {
          Get.find<PostController>().getPostList(1);
        }
      },
        builder: (jobCategoryController) {
          return DropdownSearch<PostItem>(
            selectedItem: jobCategoryController.selectedPostItem,
            itemLabel: (item) => item.title ?? "",
            searchController: searchController,
            onSearch: (val) {
              jobCategoryController.getPostList(1, search: val.trim());
            },
            listWidgetBuilder: () => SingleChildScrollView(
                child: PostListWidget(fromFilter: true,
                    scrollController: scrollController)),
          );
        },
      ),
    ],
    );
  }
}
