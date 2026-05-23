import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_experience/controller/candidate_experience_controller.dart';
import 'package:job/feature/candidate_experience/presentation/widgets/add_new_candidate_experience_widget.dart';
import 'package:job/feature/candidate_experience/presentation/widgets/candidate_experience_item_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/styles.dart';

class CandidateExperienceListWidget extends StatelessWidget {
  final ScrollController scrollController;

  const CandidateExperienceListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return GetBuilder<CandidateExperienceController>(initState: (_) {
        Get.find<CandidateExperienceController>().getCandidateExperienceList(1);
      },
      builder: (experienceController) {
        final experienceData = experienceController.candidateExperienceModel?.data;

        return GetBuilder<CandidatePanelController>(builder: (panelController) {
          final listWidget = _buildPaginatedList(
            controller: experienceController, data: experienceData);
            if (!isDesktop) {
              return listWidget;
            }
            return CustomExpandCollapse(
              trailing: CustomAddNewButtonWidget(title: "add_new_experience".tr,
                onTap: _showAddExperienceDialog),
              initiallyExpanded: true,
              isExpanded: panelController.isExpanded("work_experience"),
              onChanged: (_) => panelController.toggleSection("work_experience"),
              header: Text("experience".tr, style: sectionHeadingTextStyle(context)),
              child: listWidget);
          },
        );
      },
    );
  }

  Widget _buildPaginatedList({required CandidateExperienceController controller, required dynamic data}) {
    return PaginatedListWidget(
      scrollController: scrollController,
      onPaginate: (offset) async {
        await controller.getCandidateExperienceList(offset ?? 1);
      },
      totalSize: data?.total ?? 0,
      offset: data?.currentPage ?? 0,
      itemView: _buildExperienceList(data),
    );
  }

  Widget _buildExperienceList(dynamic data) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data?.data?.length ?? 0,
      itemBuilder: (context, index) {
        final item = data?.data?[index];
        return CandidateExperienceItemWidget(index: index, candidateExperienceItem: item);
      },
      separatorBuilder: (_, __) => const CustomDivider(),
    );
  }

  void _showAddExperienceDialog() {
    Get.dialog(CustomDialogWidget(width: 700, title: "experience".tr,
      child: const AddNewCandidateExperienceWidget()),
    );
  }
}