import 'package:ecommerce/common/layout/custom_dialog_widget.dart';
import 'package:ecommerce/feature/human_resource/interview/presentation/widgets/add_new_interview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/common/layout/list_layout_widget.dart';
import 'package:ecommerce/feature/human_resource/interview/controller/interview_controller.dart';
import 'package:ecommerce/feature/human_resource/interview/domain/models/interview_model.dart';
import 'package:ecommerce/feature/human_resource/interview/presentation/widgets/interview_item_widget.dart';

class InterviewListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const InterviewListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InterviewController>(
      initState: (val) => Get.find<InterviewController>().getInterviewList(1),
      builder: (interviewController) {
        final interviewModel = interviewController.interviewModel;
        final interviewData = interviewModel?.data;

        return GenericListSection<InterviewItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["interview_list".tr],
          addNewTitle: "add_new_interview".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "interview".tr,
              child: const AddNewInterviewWidget())),
          headings: const ["name", "title", "department", "interviewer", "date","feedback", "rating", "position"],

          scrollController: scrollController,
          isLoading: interviewModel == null,
          totalSize: interviewData?.total ?? 0,
          offset: interviewData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await interviewController.getInterviewList(offset ?? 1),

          items: interviewData?.data ?? [],
          itemBuilder: (item, index) => InterviewItemWidget(
            index: index,
            interviewItem: item,
          ),
        );
      },
    );
  }
}