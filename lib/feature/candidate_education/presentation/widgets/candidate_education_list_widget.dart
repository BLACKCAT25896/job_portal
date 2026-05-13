import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_education/controller/candidate_education_controller.dart';
import 'package:job/feature/candidate_education/presentation/widgets/add_new_candidate_education_widget.dart';
import 'package:job/feature/candidate_education/presentation/widgets/candidate_education_item_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/util/styles.dart';

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

        return GetBuilder<CandidatePanelController>(
          builder: (controller) {
            return CustomExpandCollapse(
              trailing: CustomAddNewButtonWidget(title: "add_new_education".tr, onTap: (){
                Get.dialog(CustomDialogWidget(title: "education".tr,
                    child: const AddNewCandidateEducationWidget()));
              },),
              initiallyExpanded: true,
              isExpanded: controller.isExpanded("education"),
              onChanged: (v) => controller.toggleSection("education"),
              header: Text("education".tr, style: sectionHeadingTextStyle(context)),
              child: PaginatedListWidget(
                scrollController: scrollController,
                onPaginate: (offset) async => await candidateEducationController.getCandidateEducationList(offset ?? 1),
                totalSize: candidateEducationData?.total ?? 0,
                offset: candidateEducationData?.currentPage ?? 0,
                itemView: ListView.separated(
                  padding: EdgeInsets.zero,
                    shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: candidateEducationData?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = candidateEducationData?.data?[index];
                    return CandidateEducationItemWidget(index: index, candidateEducationItem: item);
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