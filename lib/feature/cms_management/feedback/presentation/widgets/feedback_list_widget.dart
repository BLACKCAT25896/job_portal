import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/cms_management/feedback/domain/model/feedback_model.dart';
import 'package:ecommerce/feature/cms_management/feedback/logic/feedback_controller.dart';
import 'package:ecommerce/feature/cms_management/feedback/presentation/widgets/create_new_feedback_widget.dart';
import 'package:ecommerce/feature/cms_management/feedback/presentation/widgets/feedback_item_widget.dart';
import 'package:ecommerce/util/dimensions.dart';

class FeedbackListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const FeedbackListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedbackController>(
      initState: (val) => Get.find<FeedbackController>().getFeedback(1),
      builder: (controller) {
        final model = controller.feedbackModel;
        final data = model?.data;

        return GenericListSection<FeedbackItem>(
          sectionTitle: "cms_management".tr,
          pathItems: ["feedback".tr],
          addNewTitle: "add_new_feedback".tr,
          onAddNewTap: () => showDialog(context: context,
            builder: (_) => Dialog(child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                child: const CreateNewFeedbackWidget()))),
          headings: const ["image", "name", "rating", "review", "status"],
          scrollController: scrollController,
          isLoading: model == null,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (offset) async => await controller.getFeedback(offset ?? 1),
          items: data?.data ?? [],
          itemBuilder: (item, index) => FeedbackItemWidget(index: index, feedbackItem: item),
        );
      },
    );
  }
}
