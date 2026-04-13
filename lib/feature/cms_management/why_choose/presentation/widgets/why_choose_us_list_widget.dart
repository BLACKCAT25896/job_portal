import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/cms_management/why_choose/domain/model/why_choose_model.dart';
import 'package:ecommerce/feature/cms_management/why_choose/logic/why_choose_controller.dart';
import 'package:ecommerce/feature/cms_management/why_choose/presentation/widgets/why_choose_us_item_widget.dart';
import 'package:ecommerce/feature/cms_management/why_choose/presentation/widgets/create_new_why_choose_us_widget.dart';
import 'package:ecommerce/util/dimensions.dart';

class WhyChooseUsListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const WhyChooseUsListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WhyChooseController>(
      initState: (val) => Get.find<WhyChooseController>().getWhyChooseUs(1),
      builder: (controller) {
        final model = controller.conceptualModel;
        final data = model?.data;

        return GenericListSection<WhyChooseItem>(
          sectionTitle: "cms_management".tr,
          pathItems: ["why_choose_us".tr],
          addNewTitle: "add_new_why_choose_us".tr,
          onAddNewTap: () => showDialog(
            context: context,
            builder: (_) => Dialog(child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: const CreateNewWhyChooseUsWidget(),
            )),
          ),
          headings: const ["image", "title", "description"],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getWhyChooseUs(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => WhyChooseUsItemWidget(
            index: index,
            whyChooseUsItem: item,
          ),
        );
      },
    );
  }
}
