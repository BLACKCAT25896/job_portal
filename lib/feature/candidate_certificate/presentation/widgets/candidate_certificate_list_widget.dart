import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/layout/custom_add_new_button_widget.dart';
import 'package:job/common/layout/custom_dialog_widget.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/common/widget/paginated_list_widget.dart';
import 'package:job/feature/candidate_certificate/controller/candidate_certificate_controller.dart';
import 'package:job/feature/candidate_certificate/presentation/widgets/add_new_candidate_certificate_widget.dart';
import 'package:job/feature/candidate_certificate/presentation/widgets/candidate_certificate_item_widget.dart';
import 'package:job/feature/candidate_panel/logic/candidate_panel_controller.dart';
import 'package:job/feature/candidate_panel/widgets/generic_expand_collapse_widget.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/styles.dart';

class CandidateCertificateListWidget extends StatelessWidget {
  final ScrollController scrollController;

  const CandidateCertificateListWidget({super.key, required this.scrollController});

  static const String sectionKey = "certifications";

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveHelper.isDesktop(context);

    return GetBuilder<CandidateCertificateController>(
      initState: (_) {
        Get.find<CandidateCertificateController>().getCandidateCertificateList(1);
      }, builder: (certificateController) {
        final certificateData = certificateController.candidateCertificateModel?.data;
        final content = _buildCertificateList(controller: certificateController, certificateData: certificateData);
        return GetBuilder<CandidatePanelController>(builder: (panelController) {
          if (!isDesktop) {
            return content;
          }
          return CustomExpandCollapse(
            initiallyExpanded: true,
            isExpanded: panelController.isExpanded(sectionKey),
            onChanged: (_) => panelController.toggleSection(sectionKey),
            header: Text("certifications".tr, style: sectionHeadingTextStyle(context)),
              trailing: CustomAddNewButtonWidget(title: "add_new_certificate".tr,
                onTap: _showAddCertificateDialog),

              child: content,
            );
          },
        );
      },
    );
  }

  Widget _buildCertificateList({required CandidateCertificateController controller, required dynamic certificateData,}) {
    return PaginatedListWidget(
      scrollController: scrollController,

      onPaginate: (offset) async {
        await controller.getCandidateCertificateList(offset ?? 1);
      },

      totalSize: certificateData?.total ?? 0,
      offset: certificateData?.currentPage ?? 0,

      itemView: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: certificateData?.data?.length ?? 0,
        itemBuilder: (context, index) {
          final item = certificateData?.data?[index];
          return CandidateCertificateItemWidget(index: index,
            candidateCertificateItem: item);
        },
        separatorBuilder: (_, __) => const CustomDivider(),
      ),
    );
  }

  void _showAddCertificateDialog() {
    Get.dialog(CustomDialogWidget(title: "certificate".tr,
      child: const AddNewCandidateCertificateWidget()),
    );
  }
}