import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/feature/candidate_links/controller/candidate_link_controller.dart';
import 'package:job/feature/candidate_links/presentation/widgets/add_new_candidate_link_widget.dart';
import 'package:job/feature/candidate_links/presentation/widgets/candidate_link_item_widget.dart';

import 'package:job/feature/candidate_panel/widgets/candidate_paginated_section_widget.dart';

class CandidateLinkListWidget extends StatelessWidget {
  final ScrollController scrollController;

  const CandidateLinkListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateLinkController>(initState: (_) {
        Get.find<CandidateLinkController>().getCandidateLinkList(1);
      },
      builder: (controller) {
        final data = controller.candidateLinkModel?.data;

        return CandidatePaginatedSectionWidget(
          sectionKey: "social_links",
          title: "social_links".tr,
          addButtonTitle: "add_new_link".tr,
          scrollController: scrollController,
          totalSize: data?.total ?? 0,
          offset: data?.currentPage ?? 0,
          onPaginate: (page) async {
            await controller.getCandidateLinkList(page);
          },
          onAdd: () {
            Get.dialog(CustomDialogWidget(title: "link".tr,
                child: const AddNewCandidateLinkWidget()));
          },
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data?.data?.length ?? 0,
            itemBuilder: (context, index) {
              final item = data?.data?[index];
              return CandidateLinkItemWidget(index: index, candidateLinkItem: item);
            },
            separatorBuilder: (_, __) => const CustomDivider(),
          ),
        );
      },
    );
  }
}