import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/feature/candidate_training/controller/candidate_training_controller.dart';
import 'package:job/feature/candidate_training/presentation/widgets/add_new_candidate_training_widget.dart';
import 'package:job/feature/candidate_training/presentation/widgets/candidate_training_item_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/styles.dart';

class CandidateTrainingListWidget extends StatelessWidget {
  final ScrollController scrollController;

  const CandidateTrainingListWidget({super.key, required this.scrollController});
  static const String sectionKey = "training";

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveHelper.isDesktop(context);

    return GetBuilder<CandidateTrainingController>(
      initState: (_) {
        Get.find<CandidateTrainingController>().getCandidateTrainingList(1);
      },

      builder: (trainingController) {
        final trainingData = trainingController.candidateTrainingModel?.data;
        final content = _buildTrainingList(controller: trainingController, trainingData: trainingData);
        return GetBuilder<CandidatePanelController>(
          builder: (panelController) {

            if (!isDesktop) {
              return content;
            }

            return CustomExpandCollapse(initiallyExpanded: true,
              isExpanded: panelController.isExpanded(sectionKey),
              onChanged: (_) => panelController.toggleSection(sectionKey),
              header: Text("training".tr, style: sectionHeadingTextStyle(context)),

              trailing: CustomAddNewButtonWidget(title: "add_new_training".tr,
                  onTap: _showAddTrainingDialog),
                child: content);
          },
        );
      },
    );
  }

  Widget _buildTrainingList({required CandidateTrainingController controller, required dynamic trainingData}) {
    return PaginatedListWidget(
      scrollController: scrollController,
      onPaginate: (offset) async {
        await controller.getCandidateTrainingList(offset ?? 1);
      },
      totalSize: trainingData?.total ?? 0,
      offset: trainingData?.currentPage ?? 0,
      itemView: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: trainingData?.data?.length ?? 0,
        itemBuilder: (context, index) {
          final item = trainingData?.data?[index];
          return CandidateTrainingItemWidget(
            index: index,
            candidateTrainingItem: item);
        },
        separatorBuilder: (_, __) => const CustomDivider(),
      ),
    );
  }

  void _showAddTrainingDialog() {
    Get.dialog(CustomDialogWidget(title: "training".tr,
        child: const AddNewCandidateTrainingWidget()),
    );
  }
}