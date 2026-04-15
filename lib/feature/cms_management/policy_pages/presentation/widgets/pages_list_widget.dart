import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/cms_management/policy_pages/domain/model/policy_model.dart';
import 'package:mighty_job/feature/cms_management/policy_pages/logic/pages_controller.dart';
import 'package:mighty_job/feature/cms_management/policy_pages/presentation/widgets/create_new_page_widget.dart';
import 'package:mighty_job/feature/cms_management/policy_pages/presentation/widgets/page_item_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class PagesListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const PagesListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PagesController>(
      initState: (val) => Get.find<PagesController>().getPages(1),
      builder: (controller) {
        final model = controller.pageModel;
        final data = model?.data;

        return GenericListSection<PagesItem>(sectionTitle: "page_management".tr,
          pathItems: ["pages".tr],
          addNewTitle: "add_new_page".tr,
          onAddNewTap: () => showDialog(context: context,
              builder: (_) => Dialog(child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                  child: const CreateNewPageWidget()))),
          headings: const ["title", "description"],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getPages(offset ?? 1),
          items: data?.data ?? [],
          itemBuilder: (item, index) => PageItemWidget(index: index, pageItem: item),
        );
      },
    );
  }
}
