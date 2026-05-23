import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_education/controller/candidate_education_controller.dart';
import 'package:job/feature/candidate_education/presentation/widgets/add_new_candidate_education_widget.dart';
import 'package:job/feature/candidate_education/presentation/widgets/candidate_education_item_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/styles.dart';

class CandidateEducationListWidget extends StatelessWidget {
  final ScrollController scrollController;

  const CandidateEducationListWidget({super.key, required this.scrollController});
  static const String sectionKey = "education";

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveHelper.isDesktop(context);

    return GetBuilder<CandidateEducationController>(initState: (_) {
        Get.find<CandidateEducationController>().getCandidateEducationList(1);
      }, builder: (educationController) {

      final educationData = educationController.candidateEducationModel?.data;
        final content = _buildEducationList(controller: educationController, educationData: educationData);
        return GetBuilder<CandidatePanelController>(builder: (panelController) {
          if (!isDesktop) {
            return content;
          }
            return CustomExpandCollapse(initiallyExpanded: true,
              isExpanded: panelController.isExpanded(sectionKey),
              onChanged: (_) => panelController.toggleSection(sectionKey),
              header: Text("education".tr, style: sectionHeadingTextStyle(context)),
              trailing: CustomAddNewButtonWidget(
                title: "add_new_education".tr, onTap: _showAddEducationDialog),
              child: content);
          },
        );
      },
    );
  }

  Widget _buildEducationList({required CandidateEducationController controller, required dynamic educationData,}) {
    return PaginatedListWidget(
      scrollController: scrollController,
      onPaginate: (offset) async {
        await controller.getCandidateEducationList(offset ?? 1);
      },

      totalSize: educationData?.total ?? 0,
      offset: educationData?.currentPage ?? 0,
      itemView: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: educationData?.data?.length ?? 0,
        itemBuilder: (context, index) {
          final item = educationData?.data?[index];
          return CandidateEducationItemWidget(
            index: index,
            candidateEducationItem: item,
          );
        },

        separatorBuilder: (_, __) => const CustomDivider(),
      ),
    );
  }

  void _showAddEducationDialog() {
    Get.dialog(CustomDialogWidget(title: "education".tr, child: const AddNewCandidateEducationWidget()),
    );
  }
}