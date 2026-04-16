import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/candidate_education/controller/candidate_education_controller.dart';
import 'package:mighty_job/feature/candidate_education/domain/models/candidate_education_model.dart';
import 'package:mighty_job/feature/candidate_education/presentation/widgets/add_new_candidate_education_widget.dart';
import 'package:mighty_job/feature/candidate_education/presentation/widgets/candidate_education_item_widget.dart';

class CandidateEducationListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const CandidateEducationListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateEducationController>(
      initState: (val) => Get.find<CandidateEducationController>().getCandidateEducationList(1),
      builder: (candidateEducationController) {
        final candidateEducationModel = candidateEducationController.candidateEducationModel;
        final candidateEducationData = candidateEducationModel?.data;

        return GenericListSection<CandidateEducationItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["candidateEducation_list".tr],
          addNewTitle: "add_new_candidateEducation".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "candidateEducation".tr,
              child: const AddNewCandidateEducationWidget())),
          headings: const ["name", "email", "phone","candidateEducation_status", "notes"],

          scrollController: scrollController,
          isLoading: candidateEducationModel == null,
          totalSize: candidateEducationData?.total ?? 0,
          offset: candidateEducationData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await candidateEducationController.getCandidateEducationList(offset ?? 1),

          items: candidateEducationData?.data ?? [],
          itemBuilder: (item, index) => CandidateEducationItemWidget(
            index: index,
            candidateEducationItem: item,
          ),
        );
      },
    );
  }
}