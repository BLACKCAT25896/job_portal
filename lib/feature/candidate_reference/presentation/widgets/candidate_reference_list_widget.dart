import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_reference/controller/candidate_reference_controller.dart';
import 'package:job/feature/candidate_reference/presentation/widgets/add_new_candidate_reference_widget.dart';
import 'package:job/feature/candidate_reference/presentation/widgets/candidate_reference_item_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/util/styles.dart';

class CandidateReferenceListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const CandidateReferenceListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateReferenceController>(
      initState: (val) => Get.find<CandidateReferenceController>().getCandidateReferenceList(1),
      builder: (candidateReferenceController) {
        final candidateReferenceModel = candidateReferenceController.candidateReferenceModel;
        final candidateReferenceData = candidateReferenceModel?.data;

        return GetBuilder<CandidatePanelController>(
          builder: (controller) {
            return CustomExpandCollapse(
              trailing: CustomAddNewButtonWidget(title: "add_new_reference".tr, onTap: (){
                Get.dialog(CustomDialogWidget(title: "reference".tr,
                    child: const AddNewCandidateReferenceWidget()));
              },),
              initiallyExpanded: true,
              isExpanded: controller.isExpanded("reference"),
              onChanged: (v) => controller.toggleSection("reference"),
              header: Text("reference".tr, style: sectionHeadingTextStyle(context)),
              child: PaginatedListWidget(
                scrollController: scrollController,
                onPaginate: (offset) async => await candidateReferenceController.getCandidateReferenceList(offset ?? 1),
                totalSize: candidateReferenceData?.total ?? 0,
                offset: candidateReferenceData?.currentPage ?? 0,
                itemView: ListView.separated(
                  padding: EdgeInsets.zero,
                    shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: candidateReferenceData?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = candidateReferenceData?.data?[index];
                    return CandidateReferenceItemWidget(index: index, candidateReferenceItem: item);
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