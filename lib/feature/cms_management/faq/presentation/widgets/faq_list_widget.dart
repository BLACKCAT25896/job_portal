import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/cms_management/faq/domain/model/faq_model.dart';
import 'package:mighty_job/feature/cms_management/faq/logic/faq_controller.dart';
import 'package:mighty_job/feature/cms_management/faq/presentation/widgets/create_new_faq_widget.dart';
import 'package:mighty_job/feature/cms_management/faq/presentation/widgets/faq_item_widget.dart';
import 'package:mighty_job/util/dimensions.dart';

class FaqListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const FaqListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaqController>(
      initState: (val) => Get.find<FaqController>().getFaq(1),
      builder: (controller) {
        final FaqModel? model = controller.faqModel;
        final data = model?.data;

        return GenericListSection<FaqItem>(
          sectionTitle: "cms_management".tr,
          pathItems: ["faq".tr],
          addNewTitle: "add_new_faq".tr,
          onAddNewTap: () => showDialog(
            context: context,
            builder: (_) => Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                child: const CreateNewFaqWidget(),
              ),
            ),
          ),
          headings: const [
            "question",
            "answer",
            "action",
          ],

          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getFaq(offset ?? 1),

          items: data?.data ?? [],
          itemBuilder: (item, index) => FaqItemWidget(
            index: index,
            faqItem: item,
          ),
        );
      },
    );
  }
}
