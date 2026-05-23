import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/feature/candidate_panel/widgets/candidate_paginated_section_widget.dart';
import 'package:job/feature/candidate_reference/controller/candidate_reference_controller.dart';
import 'package:job/feature/candidate_reference/presentation/widgets/add_new_candidate_reference_widget.dart';
import 'package:job/feature/candidate_reference/presentation/widgets/candidate_reference_item_widget.dart';

class CandidateReferenceListWidget extends StatelessWidget {
  final ScrollController scrollController;

  const CandidateReferenceListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateReferenceController>(
      initState: (_) {
        Get.find<CandidateReferenceController>().getCandidateReferenceList(1);
      },
      builder: (controller) {
        final data = controller.candidateReferenceModel?.data;

        return CandidatePaginatedSectionWidget(
          sectionKey: "reference",
          title: "reference".tr,
          addButtonTitle: "add_new_reference".tr,
          scrollController: scrollController,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (page) async {
            await controller.getCandidateReferenceList(page);
          },
          onAdd: () {
            Get.dialog(CustomDialogWidget(title: "reference".tr,
                child: const AddNewCandidateReferenceWidget()));
          },
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data?.data?.length ?? 0,
            itemBuilder: (context, index) {
              final item = data?.data?[index];
              return CandidateReferenceItemWidget(index: index,
                candidateReferenceItem: item);
            },
            separatorBuilder: (_, __) => const CustomDivider(),
          ),
        );
      },
    );
  }
}