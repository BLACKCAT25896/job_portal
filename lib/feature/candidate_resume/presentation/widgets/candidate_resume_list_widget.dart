import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/candidate_resume/controller/candidate_resume_controller.dart';
import 'package:mighty_job/feature/candidate_resume/domain/models/candidate_resume_model.dart';
import 'package:mighty_job/feature/candidate_resume/presentation/widgets/add_new_candidate_resume_widget.dart';
import 'package:mighty_job/feature/candidate_resume/presentation/widgets/candidate_resume_item_widget.dart';

class CandidateResumeListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const CandidateResumeListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateResumeController>(
      initState: (val) => Get.find<CandidateResumeController>().getCandidateResumeList(1),
      builder: (candidateResumeController) {
        final candidateResumeModel = candidateResumeController.candidateResumeModel;
        final candidateResumeData = candidateResumeModel?.data;

        return GenericListSection<CandidateResumeItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["candidate_resume_list".tr],
          addNewTitle: "add_new_candidate_resume".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "candidate_resume".tr,
              child: const AddNewCandidateResumeWidget())),
          headings: const ["title", "resume"],

          scrollController: scrollController,
          isLoading: candidateResumeModel == null,
          totalSize: candidateResumeData?.total ?? 0,
          offset: candidateResumeData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await candidateResumeController.getCandidateResumeList(offset ?? 1),

          items: candidateResumeData?.data ?? [],
          itemBuilder: (item, index) => CandidateResumeItemWidget(
            index: index,
            candidateResumeItem: item,
          ),
        );
      },
    );
  }
}