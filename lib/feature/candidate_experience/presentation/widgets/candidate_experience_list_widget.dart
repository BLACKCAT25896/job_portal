import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_experience/controller/candidate_experience_controller.dart';
import 'package:job/feature/candidate_experience/presentation/widgets/add_new_candidate_experience_widget.dart';
import 'package:job/feature/candidate_experience/presentation/widgets/candidate_experience_item_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/util/styles.dart';

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

        return GetBuilder<CandidatePanelController>(
            builder: (controller) {
              return CustomExpandCollapse(
                trailing: CustomAddNewButtonWidget(title: "add_new_experience".tr, onTap: (){
                  Get.dialog(CustomDialogWidget(width: 700,
                      title: "experience".tr,
                      child: const AddNewCandidateExperienceWidget()));
                },),
                initiallyExpanded: true,
                isExpanded: controller.isExpanded("work_experience"),
                onChanged: (v) => controller.toggleSection("work_experience"),
                header: Text("experience".tr, style: sectionHeadingTextStyle(context)),
                child: PaginatedListWidget(
                    scrollController: scrollController,
                    onPaginate: (offset) async => await candidateExperienceController.getCandidateExperienceList(offset ?? 1),
                    totalSize: candidateExperienceData?.total ?? 0,
                    offset: candidateExperienceData?.currentPage ?? 0,
                    itemView: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: candidateExperienceData?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = candidateExperienceData?.data?[index];
                          return CandidateExperienceItemWidget(index: index, candidateExperienceItem: item);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const CustomDivider();
                        })
                ),
              );
            }
        );
      },
    );
  }
}