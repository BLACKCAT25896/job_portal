import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/cms_management/explore/domain/model/explore_model.dart';
import 'package:mighty_job/feature/cms_management/explore/logic/explore_controller.dart';
import 'package:mighty_job/feature/cms_management/explore/presentation/widgets/create_new_explore_widget.dart';
import 'package:mighty_job/feature/cms_management/explore/presentation/widgets/explore_item_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class ExploreListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const ExploreListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(
      initState: (val) => Get.find<ExploreController>().getExplore(1),
      builder: (controller) {
        final model = controller.exploreModel;
        final data = model?.data;

        return GenericListSection<ExploreItem>(
          sectionTitle: "cms_management".tr,
          pathItems: ["explore".tr],
          addNewTitle: "add_new_explore".tr,
          onAddNewTap: () => showDialog(
            context: context,
            builder: (_) => Dialog(child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
              child: const CreateNewExploreWidget(),
            )),
          ),
          headings: const [
            "image",
            "title",
            "description",
            "action",
          ],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getExplore(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => ExploreItemWidget(
            index: index,
            exploreItem: item,
          ),
        );
      },
    );
  }
}
