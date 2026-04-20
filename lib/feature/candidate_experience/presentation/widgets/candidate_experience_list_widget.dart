import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/candidate_experience/controller/candidate_experience_controller.dart';
import 'package:mighty_job/feature/candidate_experience/domain/models/candidate_experience_model.dart';
import 'package:mighty_job/feature/candidate_experience/presentation/widgets/add_new_candidate_experience_widget.dart';
import 'package:mighty_job/feature/candidate_experience/presentation/widgets/candidate_experience_item_widget.dart';

class CandidateExperienceListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const CandidateExperienceListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateExperienceController>(
      initState: (val) => Get.find<CandidateExperienceController>().getCandidateExperienceList(1),
      builder: (candidateExperienceController) {
        final candidateExperienceModel = candidateExperienceController.candidateExperienceModel;
        final candidateExperienceData = candidateExperienceModel?.data;

        return GenericListSection<CandidateExperienceItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["candidate_experience_list".tr],
          addNewTitle: "add_new_candidate_experience".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "candidate_experience".tr,
              child: const AddNewCandidateExperienceWidget())),
          headings: const ["designation", "company", "start_date","end_date"],

          scrollController: scrollController,
          isLoading: candidateExperienceModel == null,
          totalSize: candidateExperienceData?.total ?? 0,
          offset: candidateExperienceData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await candidateExperienceController.getCandidateExperienceList(offset ?? 1),

          items: candidateExperienceData?.data ?? [],
          itemBuilder: (item, index) => CandidateExperienceItemWidget(
            index: index,
            candidateExperienceItem: item,
          ),
        );
      },
    );
  }
}