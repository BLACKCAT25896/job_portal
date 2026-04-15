import 'package:mighty_job/common/layout/custom_dialog_widget.dart';
import 'package:mighty_job/feature/human_resource/candidate/presentation/widgets/add_new_candidate_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/feature/human_resource/candidate/controller/candidate_controller.dart';
import 'package:mighty_job/feature/human_resource/candidate/domain/models/candidate_model.dart';
import 'package:mighty_job/feature/human_resource/candidate/presentation/widgets/candidate_item_widget.dart';

class CandidateListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const CandidateListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateController>(
      initState: (val) => Get.find<CandidateController>().getCandidateList(1),
      builder: (candidateController) {
        final candidateModel = candidateController.candidateModel;
        final candidateData = candidateModel?.data;

        return GenericListSection<CandidateItem>(
          sectionTitle: "human_resource".tr,
          pathItems: ["candidate_list".tr],
          addNewTitle: "add_new_candidate".tr,
          onAddNewTap: () => Get.dialog(CustomDialogWidget(title: "candidate".tr,
              child: const AddNewCandidateWidget())),
          headings: const ["name", "email", "phone","candidate_status", "notes"],

          scrollController: scrollController,
          isLoading: candidateModel == null,
          totalSize: candidateData?.total ?? 0,
          offset: candidateData?.currentPage ?? 0,
          onPaginate: (offset) async =>
          await candidateController.getCandidateList(offset ?? 1),

          items: candidateData?.data ?? [],
          itemBuilder: (item, index) => CandidateItemWidget(
            index: index,
            candidateItem: item,
          ),
        );
      },
    );
  }
}