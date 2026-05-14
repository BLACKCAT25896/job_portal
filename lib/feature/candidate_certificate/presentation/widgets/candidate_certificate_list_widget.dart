import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_certificate/controller/candidate_certificate_controller.dart';
import 'package:job/feature/candidate_certificate/presentation/widgets/add_new_candidate_certificate_widget.dart';
import 'package:job/feature/candidate_certificate/presentation/widgets/candidate_certificate_item_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/util/styles.dart';

class CandidateCertificateListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const CandidateCertificateListWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CandidateCertificateController>(
      initState: (val) => Get.find<CandidateCertificateController>().getCandidateCertificateList(1),
      builder: (candidateCertificateController) {
        final candidateCertificateModel = candidateCertificateController.candidateCertificateModel;
        final candidateCertificateData = candidateCertificateModel?.data;

        return GetBuilder<CandidatePanelController>(
          builder: (controller) {
            return CustomExpandCollapse(
              trailing: CustomAddNewButtonWidget(title: "add_new_certificate".tr, onTap: (){
                Get.dialog(CustomDialogWidget(title: "certificate".tr,
                    child: const AddNewCandidateCertificateWidget()));
              },),
              initiallyExpanded: true,
              isExpanded: controller.isExpanded("certifications"),
              onChanged: (v) => controller.toggleSection("certifications"),
              header: Text("certifications".tr, style: sectionHeadingTextStyle(context)),
              child: PaginatedListWidget(
                scrollController: scrollController,
                onPaginate: (offset) async => await candidateCertificateController.getCandidateCertificateList(offset ?? 1),
                totalSize: candidateCertificateData?.total ?? 0,
                offset: candidateCertificateData?.currentPage ?? 0,
                itemView: ListView.separated(
                  padding: EdgeInsets.zero,
                    shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: candidateCertificateData?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = candidateCertificateData?.data?[index];
                    return CandidateCertificateItemWidget(index: index, candidateCertificateItem: item);
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