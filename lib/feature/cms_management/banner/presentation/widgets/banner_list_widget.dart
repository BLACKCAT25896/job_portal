import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/cms_management/banner/domain/model/banner_model.dart';
import 'package:mighty_job/feature/cms_management/banner/logic/banner_controller.dart';
import 'package:mighty_job/feature/cms_management/banner/presentation/widgets/banner_item_widget.dart';
import 'package:mighty_job/feature/cms_management/banner/presentation/widgets/create_new_banner_widget.dart';

class BannerListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const BannerListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(
      initState: (val) => Get.find<BannerController>().getBanner(1),
      builder: (controller) {
        final model = controller.bannerModel;
        final data = model?.data;

        return GenericListSection<BannerItem>(sectionTitle: "cms_management".tr, pathItems: ["banner".tr],
          addNewTitle: "add_new_banner".tr,
          onAddNewTap: () => showDialog(context: context,
            builder: (_) => CustomDialogWidget(title: "banner".tr,
                child: const CreateNewBannerWidget())),
          headings: const ["image", "title", "description", "button_name", "button_link", "action"],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getBanner(offset ?? 1),
          items: data?.data ?? [],
          itemBuilder: (item, index) => BannerItemWidget(index: index, bannerItem: item),
        );
      },
    );
  }
}
