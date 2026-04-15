import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/human_resource/recruitment/presentation/widgets/add_new_recruitment_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/human_resource/recruitment/controller/recruitment_controller.dart';
import 'package:mighty_job/feature/human_resource/recruitment/domain/models/recruitment_model.dart';
import 'package:mighty_job/feature/human_resource/recruitment/presentation/widgets/recruitment_item_widget.dart';

class RecruitmentListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const RecruitmentListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecruitmentController>(
      initState: (val) => Get.find<RecruitmentController>().getRecruitmentList(1),
      builder: (recruitmentController) {
        final recruitmentModel = recruitmentController.recruitmentModel;
        final recruitmentData = recruitmentModel?.data;

        return GenericListSection<RecruitmentItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["recruitment_list".tr],
          addNewTitle: "add_new_recruitment".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "recruitment".tr,
              child: const AddNewRecruitmentWidget())),
          headings: const ["title", "vacancy", "description", "requirements", "department", "designation", "recruiter", "status",],

          scrollController: scrollController,
          isLoading: recruitmentModel == null,
          totalSize: recruitmentData?.total ?? 0,
          offset: recruitmentData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await recruitmentController.getRecruitmentList(offset ?? 1),

          items: recruitmentData?.data ?? [],
          itemBuilder: (item, index) => RecruitmentItemWidget(
            index: index,
            recruitmentItem: item,
          ),
        );
      },
    );
  }
}