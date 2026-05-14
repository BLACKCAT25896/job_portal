import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_links/controller/candidate_link_controller.dart';
import 'package:job/feature/candidate_links/presentation/widgets/add_new_candidate_link_widget.dart';
import 'package:job/feature/candidate_links/presentation/widgets/candidate_link_item_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/util/styles.dart';

class CandidateLinkListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const CandidateLinkListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateLinkController>(
      initState: (val) => Get.find<CandidateLinkController>().getCandidateLinkList(1),
      builder: (candidateLinkController) {
        final candidateLinkModel = candidateLinkController.candidateLinkModel;
        final candidateLinkData = candidateLinkModel?.data;

        return GetBuilder<CandidatePanelController>(
          builder: (controller) {
            return CustomExpandCollapse(
              trailing: CustomAddNewButtonWidget(title: "add_new_link".tr, onTap: (){
                Get.dialog(CustomDialogWidget(title: "link".tr,
                    child: const AddNewCandidateLinkWidget()));
              },),
              initiallyExpanded: true,
              isExpanded: controller.isExpanded("social_links"),
              onChanged: (v) => controller.toggleSection("social_links"),
              header: Text("social_links".tr, style: sectionHeadingTextStyle(context)),
              child: PaginatedListWidget(
                scrollController: scrollController,
                onPaginate: (offset) async => await candidateLinkController.getCandidateLinkList(offset ?? 1),
                totalSize: candidateLinkData?.total ?? 0,
                offset: candidateLinkData?.currentPage ?? 0,
                itemView: ListView.separated(
                  padding: EdgeInsets.zero,
                    shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: candidateLinkData?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = candidateLinkData?.data?[index];
                    return CandidateLinkItemWidget(index: index, candidateLinkItem: item);
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