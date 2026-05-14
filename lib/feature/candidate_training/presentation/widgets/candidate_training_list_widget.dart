import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_training/controller/candidate_training_controller.dart';
import 'package:job/feature/candidate_training/presentation/widgets/add_new_candidate_training_widget.dart';
import 'package:job/feature/candidate_training/presentation/widgets/candidate_training_item_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/util/styles.dart';

class CandidateTrainingListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const CandidateTrainingListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateTrainingController>(
      initState: (val) => Get.find<CandidateTrainingController>().getCandidateTrainingList(1),
      builder: (candidateTrainingController) {
        final candidateTrainingModel = candidateTrainingController.candidateTrainingModel;
        final candidateTrainingData = candidateTrainingModel?.data;

        return GetBuilder<CandidatePanelController>(
          builder: (controller) {
            return CustomExpandCollapse(
              trailing: CustomAddNewButtonWidget(title: "add_new_training".tr, onTap: (){
                Get.dialog(CustomDialogWidget(title: "training".tr,
                    child: const AddNewCandidateTrainingWidget()));
              },),
              initiallyExpanded: true,
              isExpanded: controller.isExpanded("training"),
              onChanged: (v) => controller.toggleSection("training"),
              header: Text("training".tr, style: sectionHeadingTextStyle(context)),
              child: PaginatedListWidget(
                scrollController: scrollController,
                onPaginate: (offset) async => await candidateTrainingController.getCandidateTrainingList(offset ?? 1),
                totalSize: candidateTrainingData?.total ?? 0,
                offset: candidateTrainingData?.currentPage ?? 0,
                itemView: ListView.separated(
                  padding: EdgeInsets.zero,
                    shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: candidateTrainingData?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = candidateTrainingData?.data?[index];
                    return CandidateTrainingItemWidget(index: index, candidateTrainingItem: item);
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